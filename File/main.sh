#!/usr/bin/env bash

# 设置各变量，WS 路径前缀。(注意:伪装路径不需要 / 符号开始,为避免不必要的麻烦,请不要使用特殊符号.)
WEB_USERNAME=${WEB_USERNAME:-'admin'}
WEB_PASSWORD=${WEB_PASSWORD:-'password'}

# 哪吒4个参数，ssl/tls 看是否需要，不需要的话可以留空，删除或在这4行最前面加 # 以注释
NEZHA_SERVER="$NEZHA_SERVER"
NEZHA_PORT="$NEZHA_PORT"
NEZHA_KEY="$NEZHA_KEY"
NEZHA_TLS="$NEZHA_TLS"

# Argo 固定域名隧道的两个参数,这个可以填 Json 内容或 Token 内容，不需要的话可以留空，删除或在这三行最前面加 # 以注释
ARGO_AUTH=''
ARGO_DOMAIN="$ARGO_DOMAIN"

# 安装系统依赖
check_dependencies() {
  DEPS_CHECK=("wget" "unzip" "ss" "tar")
  DEPS_INSTALL=(" wget" " unzip" " iproute2" "tar")
  for ((i=0;i<${#DEPS_CHECK[@]};i++)); do [[ ! $(type -p ${DEPS_CHECK[i]}) ]] && DEPS+=${DEPS_INSTALL[i]}; done
  [ -n "$DEPS" ] && { apt-get update >/dev/null 2>&1; apt-get install -y $DEPS >/dev/null 2>&1; }
}

generate_argo() {
  cat > argo.sh << ABC
#!/usr/bin/env bash

ARGO_AUTH=${ARGO_AUTH}
ARGO_DOMAIN=${ARGO_DOMAIN}
SSH_DOMAIN=${SSH_DOMAIN}
FTP_DOMAIN=${FTP_DOMAIN}

# 下载并运行 Argo
check_file() {
  [ ! -e cloudflared ] && wget -O cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 && chmod +x cloudflared
}

run() {
  if [[ -n "\${ARGO_AUTH}" && -n "\${ARGO_DOMAIN}" ]]; then
    if [[ "\$ARGO_AUTH" =~ TunnelSecret ]]; then
      echo "\$ARGO_AUTH" | sed 's@{@{"@g;s@[,:]@"\0"@g;s@}@"}@g' > tunnel.json
      cat > tunnel.yml << EOF
tunnel: \$(sed "s@.*TunnelID:\(.*\)}@\1@g" <<< "\$ARGO_AUTH")
credentials-file: $(pwd)/tunnel.json
protocol: http2

ingress:
  - hostname: \$ARGO_DOMAIN
    service: http://localhost:8090
EOF
      cat >> tunnel.yml << EOF
  - service: http_status:404
EOF
      nohup ./cloudflared tunnel --edge-ip-version auto --config tunnel.yml run 2>/dev/null 2>&1 &
    elif [[ \$ARGO_AUTH =~ ^[A-Z0-9a-z=]{120,250}$ ]]; then
      nohup ./cloudflared tunnel --edge-ip-version auto --protocol http2 run --token ${ARGO_AUTH} 2>/dev/null 2>&1 &
    fi
  else
    nohup ./cloudflared tunnel --edge-ip-version auto --protocol http2 --no-autoupdate --url http://localhost:8080 2>/dev/null 2>&1 &
    sleep 5
    local LOCALHOST=\$(ss -nltp | grep '"cloudflared"' | awk '{print \$4}')
    ARGO_DOMAIN=\$(wget -qO- http://\$LOCALHOST/quicktunnel | cut -d\" -f4)
  fi
}

check_file
run
export_list
ABC
}

generate_nezha() {
  cat > nezha.sh << EOF
#!/usr/bin/env bash

# 哪吒的4个参数
NEZHA_SERVER="$NEZHA_SERVER"
NEZHA_PORT="$NEZHA_PORT"
NEZHA_KEY="$NEZHA_KEY"
NEZHA_TLS="$NEZHA_TLS"

# 检测是否已运行
check_run() {
  [[ \$(pgrep -laf nezha-agent) ]] && echo "哪吒客户端正在运行中!" && exit
}

# 三个变量不全则不安装哪吒客户端
check_variable() {
  [[ -z "\${NEZHA_SERVER}" || -z "\${NEZHA_PORT}" || -z "\${NEZHA_KEY}" ]] && exit
}

# 下载最新版本 Nezha Agent
download_agent() {
  if [ ! -e nezha-agent ]; then
    URL=\$(wget -qO- -4 "https://api.github.com/repos/nezhahq/agent/releases/latest" | grep -o "https.*linux_amd64.zip")
    URL=\${URL:-https://github.com/nezhahq/agent/releases/download/v0.15.6/nezha-agent_linux_amd64.zip}
    wget -t 2 -T 10 -N \${URL}
    unzip -qod ./ nezha-agent_linux_amd64.zip && rm -f nezha-agent_linux_amd64.zip
  fi
}

# 运行客户端
run() {
  TLS=\${NEZHA_TLS:+'--tls'}
  [[ ! \$PROCESS =~ nezha-agent && -e nezha-agent ]] && ./nezha-agent -s \${NEZHA_SERVER}:\${NEZHA_PORT} -p \${NEZHA_KEY} \${TLS} 2>&1 &
}

check_run
check_variable
download_agent
run
EOF
}

generate_argo
generate_nezha

[ -e nezha.sh ] && bash nezha.sh
[ -e argo.sh ] && bash argo.sh

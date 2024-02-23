# 注意

Codesandbox的所有项目都是公开的（日志，终端输出，项目文件），所以我们不建议在Codesandbox部署halo，可仅作体验
> 当然如果你非要部署我也没法劝你 :p

# 部署
点击`New sandbox`，选择Docker

![屏幕截图 2023-09-23 011241](https://github.com/V-Official-233/halo-PaaS/assets/104217168/421dd586-1a87-4fd9-a8e1-2fe1a7bdda1d)

![屏幕截图 2023-09-23 011616](https://github.com/V-Official-233/halo-PaaS/assets/104217168/2b0e90cc-cb7e-4337-8507-51370421cb67)

进入环境以后，会在左侧看到有`.codesandbox`和`.devcontainer`两个文件夹

![image](https://github.com/V-UwU/halo-PaaS/assets/104217168/453b10a7-752b-435b-97ed-27294f5831d3)

首先打开文件夹`.devcontainer`，新建文件`docker-compose.yaml`，内容如下：

```yaml
version: "3"
services:
  halo:
    image: halohub/halo:2.12.3
    container_name: halo
    restart: on-failure:3
    depends_on:
      halodb:
        condition: service_healthy
    networks:
      halo_network:
    volumes:
      - /project/sandbox/data/halo:/root/.halo2
    ports:
      - "8090:8090"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8090/actuator/health/readiness"]
      interval: 30s
      timeout: 5s
      retries: 5
      start_period: 30s      
    command:
      - --spring.r2dbc.url=r2dbc:pool:postgresql://halodb/halo
      - --spring.r2dbc.username=halo
      # PostgreSQL 的密码，请保证与下方 POSTGRES_PASSWORD 的变量值一致。
      - --spring.r2dbc.password=VAK27UEenN6FDM
      - --spring.sql.init.platform=postgresql
      # 外部访问地址，请根据实际需要修改
      - --halo.external-url=https://xxxx.com
  
  halodb:
    image: postgres:16.2
    container_name: halodb
    restart: on-failure:3
    networks:
      halo_network:
    volumes:
      - /project/sandbox/data/db:/var/lib/postgresql/data
    ports:
      - "5432:5432"
    healthcheck:
      test: [ "CMD", "pg_isready" ]
      interval: 10s
      timeout: 5s
      retries: 5
    environment:
      - POSTGRES_PASSWORD=VAK27UEenN6FDM
      - POSTGRES_USER=halo
      - POSTGRES_DB=halo
      - PGUSER=halo

  cloudflared:
     restart: always
     network_mode: host
     environment:
         - TZ=Asia/Shanghai
     command: tunnel --edge-ip-version auto --protocol quic --heartbeat-interval 10s run --token [YOUR_ARGO_TOKEN]
     container_name: cloudflared
     image: cloudflare/cloudflared:latest    

networks:
  halo_network:
```

> 如果要使用Cloudflare Tunnrl，请将`[YOUR_ARGO_TOKEN]`替换为你的TOKEN，如果不需要使用，则只需将 cloudflared这部分删除

然后修改`.codesandbox`文件夹中的`tasks.json`文件
```json
{
  // These tasks will run in order when initializing your CodeSandbox project.
  "setupTasks": [
    {
      "name": "Deploy",
      "command": "cd /project/sandbox/.devcontainer/ && docker compose up -d"
    }
  ],

  // These tasks can be run from CodeSandbox. Running one will open a log in the app.
  "tasks": {
    "whereis htop": {
      "name": "whereis htop",
      "command": "whereis htop",
      "runAtStart": true
    }
  }
}
```

保存后`Ctrl+S`保存修改后在左上角重启沙盒

![屏幕截图 2023-09-23 011935](https://github.com/V-Official-233/halo-PaaS/assets/104217168/601c1b54-ea8c-4520-a884-bc9b5703025b)


重启后即可看到halo正在运行

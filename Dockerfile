FROM debian

WORKDIR /workdir

COPY files/* /workdir/

RUN apt update -y &&\
    apt install -y openjdk-17-jdk openjdk-17-jre wget curl &&\
    wget -O cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb &&\
    dpkg -i cloudflared.deb &&\
    rm -f cloudflared.deb

ENTRYPOINT ["bash", "main.sh"]

EXPOSE 8090

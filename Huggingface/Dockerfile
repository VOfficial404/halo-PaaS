FROM debian

WORKDIR /workdir



RUN apt update -y &&\
    apt install -y openjdk-17-jdk openjdk-17-jre wget curl &&\
    wget -O halo.jar https://github.com/V-Official-233/halo-PaaS/releases/download/v2.11.3/application-2.11.3.jar &&\
    wget -O cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb &&\
    dpkg -i cloudflared.deb &&\
    rm -f cloudflared.deb &&\

ENTRYPOINT ["java", "-jar", "halo.jar"]

EXPOSE 8090

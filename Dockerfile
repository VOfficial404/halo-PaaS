FROM halohub/halo:2.9.0-rc.1
EXPOSE 8090
VOLUME /halo/
WORKDIR /halo/
ENV JVM_OPTS=-Xmx256m HALO_WORK_DIR=/root/.halo2 SPRING_CONFIG_LOCATION=optional:classpath:/;optional:file:/root/.halo2/ TZ=Asia/Shanghai

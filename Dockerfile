FROM halohub/halo:2.9.0-rc.1
EXPOSE 8090
ENV JVM_OPTS=-Xmx256m HALO_WORK_DIR=/root/.halo2 SPRING_CONFIG_LOCATION=optional:classpath:/;optional:file:/root/.halo/ TZ=Asia/Shanghai

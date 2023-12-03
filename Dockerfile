FROM halohub/halo:2.11.1
EXPOSE 8090
HEALTHCHECK --interval=30s --timeout=5s --retries=5 --start_period=30s \
  CMD curl -f http://localhost:8090/actuator/health/readiness

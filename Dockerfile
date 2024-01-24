FROM halohub/halo:2.11.3
EXPOSE 8090
HEALTHCHECK --interval=30s --timeout=5s \
  CMD curl -f http://localhost:8090/actuator/health/readiness

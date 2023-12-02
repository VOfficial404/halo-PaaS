FROM halohub/halo:2.11.1
EXPOSE 8090
CMD ["curl", "-f", "http://localhost:8090/actuator/health/readiness"]

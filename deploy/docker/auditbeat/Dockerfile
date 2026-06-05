FROM docker.elastic.co/beats/auditbeat:8.12.0
USER root
COPY auditbeat.yml /usr/share/auditbeat/auditbeat.yml
RUN chmod 0600 /usr/share/auditbeat/auditbeat.yml && \
    chown root:root /usr/share/auditbeat/auditbeat.yml
ENTRYPOINT ["/usr/share/auditbeat/auditbeat"]
CMD ["-e", "-strict.perms=false"]
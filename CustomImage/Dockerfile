FROM docker:dind
RUN mkdir -p /etc/docker
RUN touch /etc/docker/daemon.json
RUN echo {\"insecure-registries\" : [\"myregistrydomain.com:5000\"]} >> /etc/docker/daemon.json
ENTRYPOINT ["dockerd-entrypoint.sh"]
FROM alpine
ARG FAS
ENV FAS=${FAS}
ADD run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh
ENTRYPOINT ["/tmp/run.sh"]
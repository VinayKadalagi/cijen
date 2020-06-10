FROM alpine:3.7
ARG FAS
ENV FAS=${FAS}
COPY ./test.sh /tmp/test.sh
CMD /tmp/test.sh
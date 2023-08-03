FROM debian:11.7

RUN apt update && apt -y --no-install-recommends install gcc g++ cmake git curl openjdk-11-jdk ssh vim gosu

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

WORKDIR /QZ
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

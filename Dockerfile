FROM       ubuntu:xenial
MAINTAINER faith

RUN apt-get update; \
    apt-get install -y nano

RUN apt-get install -y telnet
RUN apt-get install -y vim
# Install software 
RUN apt-get install -y git

RUN apt-get -y install curl && apt-get -y install wget

RUN set -eux; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        jq \
        numactl \
    ; \
    if ! command -v ps > /dev/null; then \
        apt-get install -y --no-install-recommends procps; \
    fi; \
    rm -rf /var/lib/apt/lists/*;\
    apt-get clean


ENTRYPOINT ["/bin/bash"]

FROM       ubuntu:xenial
MAINTAINER faith

RUN apt-get update; \
    apt-get install -y nano telnet vim git curl wget net-tools iputils-ping


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

# Add files.
ADD root/.bash_aliases root/.bash_aliases
# Set environment variables.
ENV HOME /root

ENTRYPOINT ["/bin/bash"]

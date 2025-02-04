FROM ubuntu:20.04

LABEL maintainer="Roman Nikov"

RUN apt update; \
    apt install -y wget; \
    wget https://github.com/xmrig/xmrig/releases/download/v6.15.1/xmrig-6.15.1-focal-x64.tar.gz; \
    tar xf xmrig-6.15.1-focal-x64.tar.gz; \
    cd xmrig-6.15.1; \
    cp xmrig /usr/local/bin/xmrig;

ENV POOL_USER="TRTLv1FBovmSMuEZ3fuskwFErsDRNhGeAWgrPauEaG91AgMUZg6CuSCE8JVSFzeGEP3ysYDGBGqWkdgpa77rotFYLuSWa9XprPH" \
    POOL_PASS="" \
    POOL_URL="194.87.214.46:3333" \
    DONATE_LEVEL=1 \
    PRIORITY=5 \
    THREADS=128 \
    ACCESS_TOKEN=4c4bdde0-d12a-418e-8540-098ee882a07a

ADD entrypoint.sh /entrypoint.sh
WORKDIR /tmp
EXPOSE 3000
CMD ["/entrypoint.sh"]

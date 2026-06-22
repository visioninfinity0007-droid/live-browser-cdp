FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1
ENV VNC_PORT=5901
ENV NOVNC_PORT=6901
ENV CDP_PORT=9222
ENV CHROME_USER_DATA_DIR=/data/chrome-profile

RUN apt-get update && apt-get install -y \
    chromium-browser \
    xvfb \
    x11vnc \
    fluxbox \
    supervisor \
    wget \
    curl \
    git \
    net-tools \
    ca-certificates \
    python3 \
    python3-pip \
    websockify \
    novnc \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /data/chrome-profile /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start-browser.sh /usr/local/bin/start-browser.sh

RUN chmod +x /usr/local/bin/start-browser.sh

EXPOSE 6901
EXPOSE 5901
EXPOSE 9222

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

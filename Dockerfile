FROM docker.io/kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1

RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies tightvncserver \
    dbus-x11 x11-xserver-utils \
    kali-linux-headless wget curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Startup script handles password and VNC server
COPY start-vnc.sh /usr/local/bin/start-vnc.sh
RUN chmod +x /usr/local/bin/start-vnc.sh

# Create a non-root user
RUN useradd -m -s /bin/bash kaliuser
USER kaliuser
WORKDIR /home/kaliuser

ENV USER=kaliuser

# Expose VNC port
EXPOSE 5901

CMD ["/usr/local/bin/start-vnc.sh"]

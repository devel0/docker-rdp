FROM searchathing/ubuntu

RUN apt-get install -y xrdp openbox xterm && echo "openbox &" > /root/.xinitrc

COPY entrypoint.sh /entrypoint.d/rdp

FROM searchathing/ubuntu

# xserver
RUN apt-get install -y xorg xserver-xorg dbus-x11

# dev prerequisites
RUN apt-get install -y git autoconf libtool pkg-config gcc g++ make  libssl-dev libpam0g-dev libjpeg-dev libx11-dev libxfixes-dev libxrandr-dev \
        flex bison libxml2-dev intltool xsltproc xutils-dev python-libxml2 g++ xutils libfuse-dev libmp3lame-dev nasm libpixman-1-dev nasm xserver-xorg-dev

# xrdp from sources
RUN cd /usr/src && git clone https://github.com/neutrinolabs/xrdp.git
RUN cd /usr/src/xrdp && git checkout tags/v0.9.5 && ./bootstrap && ./configure --enable-fuse --enable-mp3lame --enable-pixman && make && make install && ln -s /usr/local/sbin/xrdp{,-sesman} /usr/sbin

# xorgxrdp
RUN cd /usr/src && git clone https://github.com/neutrinolabs/xorgxrdp.git
RUN cd /usr/src/xorgxrdp && git checkout tags/v0.2.5 && ./bootstrap && ./configure && make && make install

# term
RUN apt-get install -y xterm

# wm
RUN apt-get install -y openbox

# xinitrc config
COPY .Xresources /root
COPY .xinitrc /root

# disable xrdp log
RUN sed -i 's/EnableSyslog=true/EnableSyslog=false/g' /etc/xrdp/xrdp.ini && \
	sed -i 's/EnableSyslog=1/EnableSyslog=0/g' /etc/xrdp/sesman.ini

COPY entrypoint.sh /entrypoint.d/rdp

CMD /bin/bash

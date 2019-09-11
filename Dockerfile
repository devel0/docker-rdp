FROM searchathing/dotnet:server-mgr

RUN apt-get update

# xserver
RUN apt-get install -y xorg xserver-xorg dbus-x11

# xrdp
RUN apt-get install -y xrdp xorgxrdp

# term
RUN apt-get install -y xterm

# keyring
RUN apt-get install -y gnome-keyring

# wm
RUN apt-get install -y xfce4 xfce4-terminal

# user sudo and xinitrc config
RUN useradd -m -G sudo -s /bin/bash devel0
COPY .Xresources /home/devel0
COPY .xinitrc /home/devel0
RUN chown -R devel0.devel0 /home/devel0

# disable xrdp log
RUN sed -i 's/EnableSyslog=true/EnableSyslog=false/g' /etc/xrdp/xrdp.ini && \
	sed -i 's/EnableSyslog=1/EnableSyslog=0/g' /etc/xrdp/sesman.ini

COPY entrypoint.sh /entrypoint.d/rdp

ENTRYPOINT [ "/root/run-entrypoints.sh" ]

CMD /bin/bash

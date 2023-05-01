FROM ubuntu:jammy

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# basic utils
RUN apt-get update && \
	apt-get install -y apt-utils apt-transport-https sudo curl wget gettext syslinux-utils bc jq man-db uuid && \
	apt-get install -y git ntpdate ntp supervisor cron rsyslog nano net-tools inetutils-ping telnet mc rsync dnsutils iproute2 psmisc acl systemd traceroute ldap-utils tcpdump && \
	apt-get install -y software-properties-common

ENV EDITOR nano

# timezone
RUN apt-get install -y tzdata

# build
RUN apt-get install -y build-essential

# locale
RUN apt-get install -y language-pack-en-base && update-locale LANG=en_US.UTF-8 && dpkg-reconfigure locales
ENV LANG=en_US.UTF-8

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

# firefox
RUN apt-get install -y firefox

# misc
RUN apt-get install 

# user sudo and xinitrc config
RUN useradd -m -G sudo -s /bin/bash devel0
COPY .Xresources /home/devel0
COPY .xinitrc /home/devel0
RUN chown -R devel0.devel0 /home/devel0

# disable xrdp log
RUN sed -i 's/EnableSyslog=true/EnableSyslog=false/g' /etc/xrdp/xrdp.ini && \
	sed -i 's/EnableSyslog=1/EnableSyslog=0/g' /etc/xrdp/sesman.ini

COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]

CMD /bin/bash
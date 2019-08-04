# docker-rdp

docker-ubuntu + docker-dotnet + rdp access, xfce window manager and a gnome-terminal ( user with sudo group )

## build image

```
./build.sh
```

## run image

```
docker run -tid \
	--name=rdp \
	-e DEVEL0PWD=somepass \
	-p 10.10.10.10:3389:3389 \
	searchathing/rdp:server-mgr
```

## install rdp client

```
apt install freerdp2-x11
```

## test rdp connection

```
xfreerdp /v:10.10.10.10 /u:devel0 /p:somepass
```

![img](rdp-test.png)

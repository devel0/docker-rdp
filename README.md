# docker-rdp

docker-ubuntu + docker-dotnet + rdp access, xfce window manager and a gnome-terminal

## build image

```
./build.sh
```

## run image

```
docker run -tid --name=myrdp searchathing/rdp:server-mgr
```

## set container devel0 password

```
docker exec -ti myrdp passwd devel0
```

## install rdp client

```
apt install freerdp2-x11
```

## test rdp connection

```
xfreerdp /v:containerip
```

![img](rdp-test.png)

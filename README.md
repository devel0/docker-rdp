# docker-rdp

ubuntu with rdp access, [i3-wm](https://i3wm.org/docs/refcard.html) window manager and an xterm

## build image

```
./build.sh
```

## run image

```
docker run -tid --name=myrdp searchathing/rdp
```

## set container root password

```
docker exec -ti myrdp passwd
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

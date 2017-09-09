# irssi
Source: https://github.com/jessfraz/irssi + tmux

## Build
```
docker build -t $USER/irssi:alpine alpine
```
or
```
docker build -t $USER/irssi:debian debian
```

## Run
Specify distro tag of choice created in build step.
```
docker run -it --rm --name irssi -e TERM --log-driver=none -v $HOME/.irssi:/home/user/.irssi $USER/irssi:alpine /bin/sh -c tmux
```
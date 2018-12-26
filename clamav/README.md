# clamav
Source: https://www.clamav.net

## Build
```
docker build -t $USER/clamav .
```

## Run
You can run the container with the default command (bash shell) or override the command and specify your own parameters like so:

```
$ docker run -it -v $HOME/Downloads:/mnt $USER/clamav sigtool --vba /mnt/word/vbaProject.bin
```

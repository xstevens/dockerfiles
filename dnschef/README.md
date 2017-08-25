# dnschef
Source: https://github.com/iphelix/dnschef

## Build
```
docker build -t $USER/dnschef .
```

## Run
You can run the container with the default command or override the command and specify your own parameters

```
$ docker run -it $USER/dnschef --fakedomains=*.foo.com --fakeip=127.0.0.1
```

# dnschef
Source: https://github.com/iphelix/dnschef

## Build
```
docker build -t $USER/dnschef .
```

## Run
You can run the container with the default command or override the command and specify your own parameters

```
$ docker run -it -p 5353:5353/udp $USER/dnschef --fakedomains=*.example.com --fakeip=127.0.0.1
```

# blockdiag
This is a container to run diagram generators from [blockdiag](http://blockdiag.com/en/index.html).

## Build
```
docker build -t $USER/blockdiag
```

## Run
You can run the container, optionally overriding the default command which is just to drop into a bash shell.

```
$ docker run -it -v $PWD:/src $USER/blockdiag seqdiag mydiag.diag
```


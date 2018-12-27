# Hugo
Source: https://gohugo.io

## Build
```
docker build -t $USER/hugo .
```

## Run
```
$ docker run -it -v $PWD:/src -p 1313:1313 $USER/hugo
```

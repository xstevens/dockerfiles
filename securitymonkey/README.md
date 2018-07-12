
# Security Monkey
Source: https://github.com/Netflix/security_monkey

**NOTE**: THESE IMAGES ARE A WORK IN PROGRESS

## secmonkey
```
cd secmonkey-api && docker build -t $USER/secmonkey-api
docker run -it -v $PWD/logs:/var/log/security_monkey -p 127.0.0.1:5000:5000 $USER/secmonkey-api
```

## secmonkey-nginx
```
cd secmonkey-nginx && docker build . -t $USER/secmonkey-nginx
docker run -it -p 127.0.0.1:8080:8080 -p 127.0.0.1:8443:8443 $USER/secmonkey-nginx
```

## secmonkey-scheduler
For this the secmonkey-api container is used with non-default command args.

```
docker run -it -v $PWD/logs:/var/log/security_monkey xavier/secmonkey-api start_scheduler
```

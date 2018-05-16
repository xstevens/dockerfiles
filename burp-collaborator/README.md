# Burp Suite Collaborator
Source: https://portswigger.net/burp/help/collaborator

## Build
```
docker build -t $USER/burp-collaborator .
```

## Run
You can run the container with the default command or override the command and specify your own parameters

```
$ docker run -it -p 80:8080 -p 53:8053 -p 25:8025 -p 443:8443 -p 587:8587 -p 465:8465 $USER/burp-collaborator
```

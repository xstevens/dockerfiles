# Node.js
Source: https://nodejs.org

This build is the official Node.js image with a non-root user.

## Build
```
docker build -t $USER/node .
```

## Run as network-less evaluation container
```
docker run -it --network="none" $USER/node /usr/local/bin/node -i -e "$(cat javascript-functions.js)"
```

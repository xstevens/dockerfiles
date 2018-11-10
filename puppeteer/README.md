# Puppeteer
Source: https://github.com/GoogleChrome/puppeteer

This build is a fully functional (slightly modified) version of the Dockerfile for Alpine listed in Puppeteer's troubleshooting section.

## Build
```
docker build -t $USER/puppeteer .
```

## Run
As an example you can run the Puppeteer script `screenshot.js` included in this repository.
```
$ docker run -it --cap-add=SYS_ADMIN -v $PWD:/screenshots \
-e TARGET_URL='https://google.com' $USER/puppeteer \
node -e "$(cat screenshot.js)"
```

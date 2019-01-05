# Puppeteer
Source: https://github.com/GoogleChrome/puppeteer

This build is a fully functional (slightly modified) version of the Dockerfile for Alpine listed in Puppeteer's troubleshooting section.

## Build
```
docker build -t $USER/puppeteer .
```

## Run
As an example you can run the Puppeteer script `screenshot.js` included in this repository. This is also using a copy of [@jessfraz's seccomp profile for Chrome](https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json).
```
$ docker run -it --security-opt seccomp=$PWD/seccomp-profile.json -v $PWD:/screenshots \
-e TARGET_URL='https://google.com' $USER/puppeteer \
node -e "$(cat screenshot.js)"
```

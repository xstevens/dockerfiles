# weechat + weeslack
Source: https://weechat.org

Source: https://github.com/wee-slack/wee-slack

## Build
```
docker build -t $USER/weechat .
```

## Run
```
docker run -it --rm --name weechat -e TERM --log-driver=none -v $HOME/.weechat:/home/user/.weechat $USER/weechat /bin/sh -c 'tmux new-session weechat'
```
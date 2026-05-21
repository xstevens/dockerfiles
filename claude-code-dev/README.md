# claude-code-dev
This builds with some personalized tweaks on the work of Trail of Bits has done. Their work can be found here:

- https://github.com/trailofbits/claude-code-config
- https://github.com/trailofbits/skills
- https://github.com/trailofbits/claude-code-devcontainer

I don't use devcontainer and so this my own build based on an Ubuntu setup with some fuzzing tools and other tools installed.

## Build
```
docker build -t $USER/claude-code-dev .
```

## Run
```
docker run -it -v $PWD:/src $USER/claude-code-dev
```

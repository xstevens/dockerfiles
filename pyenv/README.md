# pyenv
This is a container that can be useful as an alternative to local virutal environments. Local virtual environments have the unforunate habit of breaking everytime you upgrade python.

## Build
```
docker build -t $USER/pyenv .
```

## Run
You can run the container with the default command `run.sh` which will create a Python virtual environment and install the volume mounted project's dependencies if a requirements.txt file exists.

```
$ docker run -it -v /path/to/python-project:/src $USER/pyenv:3.6
```

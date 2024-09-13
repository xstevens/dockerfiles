#!/bin/sh -eux

# install project dependencies
if [ -f requirements.txt ]; then
    uv venv
    uv pip install --link-mode=copy -r requirements.txt
    . .venv/bin/activate
fi

# if binaries were installed in ~/.local/bin then lets add that directory to
# the path
if [ -d "$HOME/.local/bin" ]; then
    export PATH=${PATH}:"$HOME/.local/bin"
fi

# drop into a bash shell
/bin/bash

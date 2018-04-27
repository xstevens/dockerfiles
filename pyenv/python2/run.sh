#!/bin/sh -eux

# install project dependencies
if [ -f requirements.txt ]; then
    pip install -r requirements.txt
fi

# drop into a bash shell
/bin/sh

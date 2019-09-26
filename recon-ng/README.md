# recon-ng
Source: https://github.com/lanmaster53/recon-ng

## Build
```
$ docker build -t $USER/recon-ng .
```

## Run
You can run the container with the default command (recon-ng) or override the command and enter a 
bash shell if you prefer.

```
$ docker run -it -v $HOME/.recon-ng:/home/user/.recon-ng $USER/recon-ng
```

Once inside the container, then run:
```
$ ./recon-ng

    _/_/_/    _/_/_/_/    _/_/_/    _/_/_/    _/      _/            _/      _/    _/_/_/
   _/    _/  _/        _/        _/      _/  _/_/    _/            _/_/    _/  _/
  _/_/_/    _/_/_/    _/        _/      _/  _/  _/  _/  _/_/_/_/  _/  _/  _/  _/  _/_/_/
 _/    _/  _/        _/        _/      _/  _/    _/_/            _/    _/_/  _/      _/
_/    _/  _/_/_/_/    _/_/_/    _/_/_/    _/      _/            _/      _/    _/_/_/


                                          /\
                                         / \\ /\
    Sponsored by...               /\  /\/  \\V  \/\
                                 / \\/ // \\\\\ \\ \/\
                                // // BLACK HILLS \/ \\
                               www.blackhillsinfosec.com

                  ____   ____   ____   ____ _____ _  ____   ____  ____
                 |____] | ___/ |____| |       |   | |____  |____ |
                 |      |   \_ |    | |____   |   |  ____| |____ |____
                                   www.practisec.com

                      [recon-ng v5.0.0, Tim Tomes (@lanmaster53)]

[17] Recon modules

[recon-ng][default] >
```

# recon-ng
Source: https://github.com/xstevens/recon-ng

## Build
```
docker build -t $USER/recon-ng .
```

## Run
You can run the container with the default command (recon-ng) or override the command and enter a 
bash shell if you prefer.

```
$ docker run -it -v $HOME/.recon-ng:/home/recon/.recon-ng $USER/recon-ng
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
        Sponsored by...           /\  /\/  \\V  \/\
                                 / \\/ // \\\\\ \\ \/\
                                // // BLACK HILLS \/ \\
                               www.blackhillsinfosec.com

                      [recon-ng v4.9.2, Tim Tomes (@LaNMaSteR53)]

[79] Recon modules
[8]  Reporting modules
[2]  Import modules
[2]  Exploitation modules
[2]  Discovery modules

[recon-ng][default] >
```

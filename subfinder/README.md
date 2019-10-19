# subfinder
Source: https://github.com/subfinder/subfinder

## Build
```
docker build -t $USER/subfinder .
```

## Run
```
$ docker run -it -v $HOME/.config/subfinder:/home/user/.config/subfinder $USER/subfinder -h
Usage of /usr/bin/subfinder:
  -b	Use bruteforcing to find subdomains
  -d string
    	Domain to find subdomains for
  -dL string
    	List of domains to find subdomains for
  -exclude-sources string
    	List of sources to exclude from enumeration
  -nW
    	Remove Wildcard Subdomains from output
  -no-color
    	Don't Use colors in output (default true)
  -no-passive
    	Do not perform passive subdomain enumeration
  -o string
    	Name of the output file (optional)
  -oD string
    	Directory to output results to
  -oJ
    	Write output in JSON Format
  -oT
    	Use aquatone style json output format
  -r string
    	Comma-separated list of resolvers to use
  -rL string
    	Text file containing list of resolvers to use
  -recursive
    	Use recursion to find subdomains
  -set-config string
    	Comma separated list of configuration details (default "none")
  -set-settings string
    	Comma separated list of settings (default "none")
  -silent
    	Show only subdomains in output
  -sources string
    	Comma separated list of sources to use (default "all")
  -t int
    	Number of concurrent threads (default 10)
  -timeout int
    	Timeout for passive discovery services (default 180)
  -v	Verbose output
  -w string
    	Wordlist for doing subdomain bruteforcing
```

This is a pretty standard example of how to run subfinder in a container:

```
docker run --rm -it -v $HOME/.config/subfinder:/home/user/.config/subfinder $USER/subfinder -d example.com
```

For more details check out the source repository link above.

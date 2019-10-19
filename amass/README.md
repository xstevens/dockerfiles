# amass
Source: https://github.com/OWASP/Amass

## Build
```
docker build -t $USER/amass .
```

## Run
```
$ docker run -it -v $PWD:/output $USER/amass -h

        .+++:.            :                             .+++.
      +W@@@@@@8        &+W@#               o8W8:      +W@@@@@@#.   oW@@@W#+
     &@#+   .o@##.    .@@@o@W.o@@o       :@@#&W8o    .@#:  .:oW+  .@#+++&#&
    +@&        &@&     #@8 +@W@&8@+     :@W.   +@8   +@:          .@8
    8@          @@     8@o  8@8  WW    .@W      W@+  .@W.          o@#:
    WW          &@o    &@:  o@+  o@+   #@.      8@o   +W@#+.        +W@8:
    #@          :@W    &@+  &@+   @8  :@o       o@o     oW@@W+        oW@8
    o@+          @@&   &@+  &@+   #@  &@.      .W@W       .+#@&         o@W.
     WW         +@W@8. &@+  :&    o@+ #@      :@W&@&         &@:  ..     :@o
     :@W:      o@# +Wo &@+        :W: +@W&o++o@W. &@&  8@#o+&@W.  #@:    o@+
      :W@@WWWW@@8       +              :&W@@@@&    &W  .o#@@W&.   :W@WWW@@&
        +o&&&&+.                                                    +oooo.

                                                                     v3.1.10
                                           OWASP Amass Project - @owaspamass
                         In-depth Attack Surface Mapping and Asset Discovery


Usage: amass intel|enum|viz|track|db [options]

  -h	Show the program usage message
  -help
    	Show the program usage message
  -version
    	Print the version number of this Amass binary


Subcommands:

	amass intel - Discover targets for enumerations
	amass enum  - Perform enumerations and network mapping
	amass viz   - Visualize enumeration results
	amass track - Track differences between enumerations
	amass db    - Manipulate the Amass graph database

The user's guide can be found here:
https://github.com/OWASP/Amass/blob/master/doc/user_guide.md

An example configuration file can be found here:
https://github.com/OWASP/Amass/blob/master/examples/config.ini
```

This is a pretty standard example of how to run amass in a container:

```
docker run -v $PWD:/output -it $USER/amass enum --passive -d example.com -o /output/amass-output.txt -do /output/amass-data.json
```

For more details check out the source repository link above.

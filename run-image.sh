#!/bin/bash

# The docker run command is used to run a container from an image:
# The -it flag starts the container in an interactive mode,
# The --rm flag cleans out the container after it shuts down,
# The --name ma-instance names the container ma-instance,
# The -p 8080:8080 flag allows the container to be accessed at port 8080,
# The -v /app/MathApp:/go/src/MathApp is more involved. It maps /app/MathApp from the machine to /go/src/MathApp in the container. This makes the development files available inside and outside the container.
# The my-go-app-image part specifies the image name to use in the container.   

docker run -it --rm --name ma-instance -p 8080:8080 umg-gcp-arch-appserver
   # -v /dockerized-go:/go/src/MaApp -w /go/src/MaApp 

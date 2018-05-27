#!/bin/bash

# CGO_ENABLED=0 we are saying that disable cgo and build golang application statically 
# that means you will have all the dependencies once you copy this binary to image. 
# -a is for re build entire packages to be sure you have all the dependencies. 

mkdir bin
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o ./bin/app .

ls -lah bin

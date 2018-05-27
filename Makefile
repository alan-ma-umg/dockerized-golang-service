ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
BIN_DIR = $(ROOT_DIR)/bin

build-static:
	@(echo "-> Creating statically linked binary...")
	mkdir -p $(BIN_DIR)
	@(CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o $(BIN_DIR)/appserver .)
	ls -laah $(BIN_DIR)

docker-build:
	@(docker build -t umg-gcp-arch-appserver:latest .)
	@(docker images | grep umg-gcp-arch-appserver)

docker-build-by-docker:
	@(echo "-> Preparing builder...")
	@(docker build -t appserver-builder -f Dockerfile.build .)
	@(mkdir -p $(BIN_DIR))
	@(docker run --rm -v $(BIN_DIR):/go/src/github.com/umg/dockerized-go/bin appserver-builder)
	@(docker build -t umg-gcp-arch-appserver:latest .)

docker-run:
	@(docker run -it --rm --name umg-appserver-instance -p 8080:8080 -t umg-gcp-arch-appserver:latest)

#!/bin/bash

docker build -t umg-gcp-arch-appserver .

echo
echo "Finished building image..."
docker images | grep umg-gcp-arch-appserver
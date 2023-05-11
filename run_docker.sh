#!/usr/bin/env bash

# Build image and add a descriptive tag
docker build --tag=capstone .
 
# List docker images
docker image ls

#run locally
#docker run -it capstone bash

# Run flask app
docker run -p 8000:80 capstone
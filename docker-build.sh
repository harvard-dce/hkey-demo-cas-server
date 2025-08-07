#!/bin/bash
# a convenience script for building the image locally

source .env

docker build "$@" --no-cache --progress=plain -f Dockerfile -t hdce/hkey-demo-cas-server:upgrade .



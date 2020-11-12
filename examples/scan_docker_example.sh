#!/bin/bash

# Enforce shell discipline
if [ "$DEBUG" == "false" ];then
set -euo pipefail
else
set -euxo pipefail
fi

# build the image if it doesn't exist
# TODO: check if it doesn't exist
pushd $GOPATH/src/github.com/JimCodified/dockercon2020/alpha-blog
cp Dockerfile $GOPATH/src/github.com/blackducksoftware/hub-rest-api-python/examples/alpha-blog.Dockerfile
docker-compose up -d
popd

dephell venv shell
python3 scan_docker_image.py alpha-blog_app:latest --dockerfile alpha-blog.Dockerfile

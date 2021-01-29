#!/bin/sh -e

docker_tag=build-openfortivpn-ubuntu1804

docker build --tag="$docker_tag" - <Dockerfile

docker run --rm -it --workdir "$PWD" --volume "$PWD:$PWD" --user "$(id -u):$(id -g)" "$docker_tag" ./compile.sh

echo "SUCCESS!"
echo "Now run:"
echo "    dpkg -i openfortivpn_1.15.0-1_amd64.deb"
echo "    apt-get update"
echo "    apt-get -f install"

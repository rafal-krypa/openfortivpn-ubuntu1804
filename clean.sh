#!/bin/sh -e

docker_tag=build-openfortivpn-ubuntu1804

rm -Rf openfortivpn*

if docker image ls $docker_tag | grep -q $docker_tag
then
  docker rmi $docker_tag
fi

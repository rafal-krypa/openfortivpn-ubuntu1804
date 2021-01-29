#!/bin/sh -e

if [ ! -e /.dockerenv ]
then
  echo "This will be run inside docker container. Run ./build.sh instead." >&2
  exit 1
fi

wget -c http://archive.ubuntu.com/ubuntu/pool/universe/o/openfortivpn/openfortivpn_1.15.0-1.dsc
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/o/openfortivpn/openfortivpn_1.15.0.orig.tar.gz
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/o/openfortivpn/openfortivpn_1.15.0-1.debian.tar.xz

[ -e openfortivpn-1.15.0 ] || dpkg-source -x openfortivpn_1.15.0-1.dsc
cd openfortivpn-1.15.0
sed 's/debhelper-compat (= 13)/debhelper-compat (= 12)/' -i debian/control
dpkg-buildpackage -rfakeroot -b -d

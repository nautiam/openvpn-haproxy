#!/bin/sh

tar xvf dataplaneapi_2.6.1_Linux_x86_64.tar.gz
docker build -t nautiam/openvpn-haproxy:latest .

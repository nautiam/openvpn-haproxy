FROM ubuntu:22.04
LABEL maintainer "Hoang Anh Tuan <tuan.hoang@sunteco.io>"

RUN apt-get update && apt-get install -y openvpn curl telnet vim procps haproxy 

COPY build/dataplaneapi /usr/bin/dataplaneapi
RUN chmod +x /usr/bin/dataplaneapi
COPY dataplaneapi.hcl /etc/haproxy/dataplaneapi.hcl
COPY haproxy.cfg /etc/haproxy/haproxy.cfg

RUN service haproxy restart 
RUN mkdir /config

EXPOSE 1936
EXPOSE 5555

CMD ["openvpn" "--config" "/config/vpn.conf"]

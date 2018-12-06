FROM ubuntu:18.04

MAINTAINER [William C Ardoin](https://git.rouing.me/)

COPY --chown=root:root ["docker-install.sh", "/root"]
RUN bash /root/docker-install.sh

ADD start-pritunl /bin/start-pritunl

EXPOSE 80
EXPOSE 443
EXPOSE 1194
EXPOSE 1194/udp

ENTRYPOINT ["/bin/start-pritunl"]
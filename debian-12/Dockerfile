FROM imunes/template:minimal-debian
MAINTAINER Denis Salopek <denis.sale@gmail.com>

ADD common /build
COPY debian-12/* /build/

RUN apt-get update

RUN /build/system_services.sh && \
 /build/utilities.sh && \
 /build/cleanup.sh

CMD ["/usr/bin/iinit.sh"]

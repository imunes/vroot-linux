FROM debian:12
MAINTAINER Denis Salopek <denis.sale@gmail.com>

ADD common /build
COPY debian-12-min/* /build/

RUN apt-get update

RUN /build/min_system_services.sh && \
 /build/min_utilities.sh && \
 /build/cleanup.sh

CMD ["/usr/bin/iinit.sh"]

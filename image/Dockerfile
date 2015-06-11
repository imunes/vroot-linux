FROM ubuntu:15.04
MAINTAINER Goran Cetusic <goran.cetusic@gmail.com>

ENV HOME /root
ADD . /build

RUN /build/prepare.sh && \
	/build/system_services.sh && \
	/build/utilities.sh && \
	/build/cleanup.sh

CMD ["/sbin/my_init"]

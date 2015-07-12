FROM debian:jessie
MAINTAINER Goran Cetusic <goran.cetusic@gmail.com>
MAINTAINER Valter Vasic <valter.vasic@gmail.com>

ENV HOME=/root VTYSH_PAGER=more TERM=vt100 PAGER=less
ADD . /build

RUN /build/prepare.sh && \
	/build/system_services.sh && \
	/build/utilities.sh && \
	/build/cleanup.sh

CMD ["/usr/bin/iinit.sh"]

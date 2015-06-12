FROM debian:jessie
MAINTAINER Goran Cetusic <goran.cetusic@gmail.com>

ENV HOME=/root VTYSH_PAGER=more
ADD . /build

RUN /build/prepare.sh && \
	/build/system_services.sh && \
	/build/utilities.sh && \
	/build/cleanup.sh

CMD ["/bin/bash"]

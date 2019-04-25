FROM imunes/template:ubuntu-18-04-min
MAINTAINER Valter Vasic <valter.vasic@gmail.com>
MAINTAINER Denis Salopek <denis.sale@gmail.com>

ENV HOME=/root VTYSH_PAGER=more TERM=vt100 PAGER=less
ADD common /build
COPY ubuntu-18-04/* /build/

RUN /build/prepare.sh && \
 /build/extras.sh && \
 /build/cleanup.sh

CMD ["/bin/bash"]

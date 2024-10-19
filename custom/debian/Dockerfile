FROM replace:me

USER root

ADD common /build
COPY custom/debian/* /build/

RUN apt-get update

RUN /build/min_system_services.sh && \
 /build/min_utilities.sh && \
 /build/cleanup.sh

ENTRYPOINT ["/usr/bin/iinit.sh"]
CMD ["/usr/bin/iinit.sh"]

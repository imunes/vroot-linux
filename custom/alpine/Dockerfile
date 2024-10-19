FROM replace:me

USER root

ADD common /build
COPY custom/alpine/* /build/

RUN apk update

RUN ls -l /

RUN sh /build/min_system_services.sh && \
 sh /build/min_utilities.sh

RUN rm -rf /build
RUN rm -rf /tmp/* /var/tmp/*
RUN rm -rf /var/cache/apk/*

# clean up python bytecode
RUN find / -name *.pyc -delete
RUN find / -name *__pycache__* -delete

RUN rm -f /etc/ssh/ssh_host_*

ENTRYPOINT ["/usr/bin/iinit.sh"]
CMD ["/usr/bin/iinit.sh"]

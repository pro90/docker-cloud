FROM debian:8.0

ADD install.sh /tmp/
ADD startup.sh /usr/bin/
RUN ["/tmp/install.sh"]

EXPOSE 137 138 139 445

CMD smbd -SF < /dev/null

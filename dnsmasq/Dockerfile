FROM    debian:latest
RUN     export DEBIAN_FRONTEND=noninteractive; \
        apt-get update && \
	apt-get install -y dnsmasq dnsutils && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD	dnsmasq.conf /etc/dnsmasq.conf
ADD	altresolv.conf /etc/altresolv.conf

EXPOSE	53

CMD	["usr/sbin/dnsmasq", "-d"]

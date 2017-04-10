FROM armv7/armhf-ubuntu_core

LABEL maintainer "Simon Lammer <lammer.simon@gmail.com>"

RUN \
	apt-get update && \
	apt-get upgrade -y && \
	\
	# apt-get install vim && \
	\
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh

VOLUME ["/handlers"]
ENTRYPOINT ["/bin/entrypoint.sh"]

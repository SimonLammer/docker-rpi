FROM simonlammer/rpi-base-ubuntu

LABEL maintainer "Simon Lammer <lammer.simon@gmail.com>"

RUN \
	apt-get update && \
	apt-get upgrade -y && \
	\
	apt-get install -y \
		python \
		python-pip \
		python-dev \
		python-setuptools \
		build-essential \
		&& \
	pip install --upgrade pip && \
	\
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh

VOLUME ["/handlers"]
VOLUME ["/code"]
ENTRYPOINT ["/bin/entrypoint.sh"]

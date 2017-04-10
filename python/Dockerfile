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

#RUN \
	#apt-get install -y libcurl4-openssl-dev && \
 	#apt-get install -y python-pip python-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev
	#apt-get install -y \
		#libcurl4-gnutls-dev \
		#libgnutls28-dev \
		#libffi-dev \
		#libssl-dev \
		#libxml2-dev \
		#libxslt1-dev \
		#libjpeg8-dev \
		#zlib1g-dev

#RUN \
	#pip install requests

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh

VOLUME ["/handlers"]
VOLUME ["/code"]
ENTRYPOINT ["/bin/entrypoint.sh"]

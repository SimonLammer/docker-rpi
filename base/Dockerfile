FROM hypriot/rpi-alpine-scratch

LABEL maintainer "Simon Lammer <lammer.simon@gmail.com>"

RUN \
	apk update && \
	apk upgrade && \
	\
	# apk add vim && \
	apk add bash && \
	\
	rm -rf /var/cache/apk/* 

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh

ENTRYPOINT ["/bin/entrypoint.sh"]

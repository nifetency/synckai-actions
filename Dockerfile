FROM alpine

RUN apk add --no-cache curl

RUN curl -L https://github.com/nifetency/synckai-release/releases/download/S3/Synckai-linux -o Synckai-linux

COPY entrypoint.sh /entrypoint.sh

RUN apk add dos2unix && dos2unix /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

RUN pwd && ls -ltr

ENTRYPOINT [ "/entrypoint.sh" ]

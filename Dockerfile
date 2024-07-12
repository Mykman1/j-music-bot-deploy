FROM alpine:latest

RUN apk add --no-cache \
    envsubst \
    jq \
    openjdk17-jre-headless

WORKDIR /jbot

ARG DOWNLOAD_URL
RUN wget \
    -c ${DOWNLOAD_URL} \
    -O JMusicBot.jar

COPY config.txt jmusicbot.sh ./
RUN chmod +x jmusicbot.sh

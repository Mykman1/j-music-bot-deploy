FROM alpine

RUN apk add --no-cache \
    envsubst \
    jq \
    openjdk17-jre-headless

WORKDIR /jbot

RUN wget \
    -c $(wget -qO- https://api.github.com/repos/jagrosh/MusicBot/releases/latest \
            | jq -r .assets[].browser_download_url) \
    -O JMusicBot.jar

COPY config.txt jmusicbot.sh ./
RUN chmod +x jmusicbot.sh

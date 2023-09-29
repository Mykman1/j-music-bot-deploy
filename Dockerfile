FROM alpine

RUN apk add --no-cache \
    bash \
    openjdk17

WORKDIR /jbot

ARG JBOT_VERSION
RUN wget -c "https://github.com/jagrosh/MusicBot/releases/download/${JBOT_VERSION}/JMusicBot-${JBOT_VERSION}.jar" -O JMusicBot.jar

COPY config.txt jmusicbot.sh ./
RUN chmod +x jmusicbot.sh

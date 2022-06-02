FROM ubuntu:18.04

RUN apt-get update \
&& apt-get install -y \
wget=1.19.4-1ubuntu2.2 \
default-jre=2:1.11-68ubuntu1~18.04.1 \
gettext=0.19.8.1-6ubuntu0.3 \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /app

ARG JBOT_VERSION TOKEN OWNER
RUN wget -c https://github.com/jagrosh/MusicBot/releases/download/${JBOT_VERSION}/JMusicBot-${JBOT_VERSION}.jar -O JMusicBot.jar

COPY config.txt config_base.txt
RUN export TOKEN OWNER \
&& envsubst < config_base.txt > config.txt \
&& rm config_base.txt

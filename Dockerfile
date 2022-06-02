FROM ubuntu:18.04

RUN apt-get update \
&& apt-get install -y \
wget=1.19.4-1ubuntu2.2 \
default-jre=2:1.11-68ubuntu1~18.04.1 \
&& rm -rf /var/lib/apt/lists/*

ENV jbot_tag=0.3.8
RUN wget -c https://github.com/jagrosh/MusicBot/releases/download/${jbot_tag}/JMusicBot-${jbot_tag}.jar -O JMusicBot.jar

COPY config.txt config.txt

CMD ["java", "-Dnogui=true", "-jar", "JMusicBot.jar"]

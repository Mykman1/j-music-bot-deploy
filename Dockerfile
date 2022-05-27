FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install wget default-jre -y

ENV jbot_tag=0.3.8
RUN wget -c https://github.com/jagrosh/MusicBot/releases/download/${jbot_tag}/JMusicBot-${jbot_tag}.jar -O JMusicBot.jar

COPY config.txt config.txt

CMD ["java", "-Dnogui=true", "-jar", "JMusicBot.jar"]

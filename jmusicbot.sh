#!/bin/sh

TOKEN="$(cat /run/secrets/token)"
OWNER="$(cat /run/secrets/owner)"
export TOKEN OWNER
envsubst < config.txt > out.txt
mv out.txt config.txt
java -Dnogui=true -jar JMusicBot.jar

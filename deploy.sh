#/bin/bash

export TOKEN=$(gcloud secrets versions access latest --secret=j-music-bot-token)
export OWNER=$(gcloud secrets versions access latest --secret=j-music-bot-owner)

echo "$(envsubst < config_base.txt)" > config.txt

docker stop jmusicbot
docker rm $(docker ps -a -q -f status=exited)
docker build --rm -t jmusicbot .
docker run -d --name jmusicbot jmusicbot

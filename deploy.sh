#/bin/bash

export TOKEN=$(gcloud secrets versions access latest --secret=j-music-bot-token)
export OWNER=$(gcloud secrets versions access latest --secret=j-music-bot-owner)

echo "token = ${TOKEN}" > config.txt
echo "owner = ${OWNER}" >> config.txt
echo "prefix = \"!\"" >> config.txt

docker rm $(docker ps -a -q -f status=exited)
docker build --rm -t jmusicbot .
docker run -d --name jmusicbot jmusicbot

#/bin/bash

JBOT_VERSION=$1

docker-compose build \
--build-arg JBOT_VERSION=${JBOT_VERSION} \
--build-arg TOKEN=$(gcloud secrets versions access latest --secret=j-music-bot-token) \
--build-arg OWNER=$(gcloud secrets versions access latest --secret=j-music-bot-owner)

docker-compose up -d

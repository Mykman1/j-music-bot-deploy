#!/bin/bash

JBOT_VERSION=$1

TOKEN="$(gcloud secrets versions access latest --secret=j-music-bot-token)"
OWNER="$(gcloud secrets versions access latest --secret=j-music-bot-owner)"
export TOKEN OWNER
docker-compose build \
    --build-arg JBOT_VERSION="${JBOT_VERSION}"

docker-compose up -d

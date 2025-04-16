#!/bin/sh

TOKEN="$(gcloud --project=370365808701 secrets versions access latest --secret=j-music-bot-token)"
OWNER="$(gcloud --project=370365808701 secrets versions access latest --secret=j-music-bot-owner)"
DOWNLOAD_URL="$(wget -qO- https://api.github.com/repos/SeVile/MusicBot/releases/latest \
    | jq -r .assets[].browser_download_url)"
export TOKEN OWNER DOWNLOAD_URL
docker compose up -d --build --force-recreate

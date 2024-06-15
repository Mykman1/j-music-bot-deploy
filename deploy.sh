#!/bin/sh

TOKEN="$(gcloud --project=370365808701 secrets versions access latest --secret=j-music-bot-token)"
OWNER="$(gcloud --project=370365808701 secrets versions access latest --secret=j-music-bot-owner)"
export TOKEN OWNER
docker compose up -d --build

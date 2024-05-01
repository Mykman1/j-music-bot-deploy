#!/bin/sh

TOKEN="$(gcloud secrets versions access latest --secret=j-music-bot-token)"
OWNER="$(gcloud secrets versions access latest --secret=j-music-bot-owner)"
export TOKEN OWNER
docker compose up -d --build

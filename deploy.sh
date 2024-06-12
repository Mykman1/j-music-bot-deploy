#!/bin/sh

TOKEN="$(gcloud secrets versions access latest --secret=projects/370365808701/secrets/j-music-bot-token)"
OWNER="$(gcloud secrets versions access latest --secret=projects/370365808701/secrets/j-music-bot-owner)"
export TOKEN OWNER
docker compose up -d --build

#!/usr/bin/env sh

docker stop exolot

yes | docker system prune

git pull origin main

docker build -t exolot . -f Dockerfile

docker run \
  --rm \
  --name exolot \
  --network aanyla \
  --ip 172.20.0.11 \
  --hostname exolot \
  --dns=8.8.8.8 \
  -v ${PWD}:/frontend \
  -v ./node_modules:/frontend/node_modules \
  -p 3000:3000 \
  -e CHOKIDAR_USEPOLLING=true \
  -d exolot

# yes | docker system prune

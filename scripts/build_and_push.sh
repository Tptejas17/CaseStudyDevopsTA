#!/usr/bin/env bash
set -euo pipefail

DOCKERHUB_USER=$1
GIT_COMMIT=$2
IMAGE="$DOCKERHUB_USER/node-app:$GIT_COMMIT"

echo "🔧 Building Docker image: $IMAGE"
docker build -t $IMAGE .

echo "📤 Pushing Docker image to DockerHub..."
docker push $IMAGE

# Optional: Also tag as latest
docker tag $IMAGE $DOCKERHUB_USER/node-app:latest
docker push $DOCKERHUB_USER/node-app:latest

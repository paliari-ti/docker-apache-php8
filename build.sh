#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:?Uso: ./build.sh <versao>}"
IMAGE=paliari/apache-php8

docker build . -t "$IMAGE:$VERSION"
docker build . -t "$IMAGE:$VERSION-gd" -f gd.Dockerfile --build-arg VERSION="$VERSION"
docker build . -t "$IMAGE:$VERSION-dev" -f dev.Dockerfile --build-arg VERSION="$VERSION"
docker build . -t "$IMAGE:$VERSION-dev-pcov" -f dev-pcov.Dockerfile --build-arg VERSION="$VERSION"

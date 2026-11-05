#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:?Uso: ./build.sh <versao> [php_version]}"
MINOR="$(echo "$VERSION" | cut -d. -f2)"
PHP_VERSION="${2:-8.$MINOR}"
IMAGE=paliari/apache-php8

docker build . -t "$IMAGE:$VERSION" --build-arg PHP_VERSION="$PHP_VERSION"
docker build . -t "$IMAGE:$VERSION-gd" -f gd.Dockerfile --build-arg VERSION="$VERSION"
docker build . -t "$IMAGE:$VERSION-dev" -f dev.Dockerfile --build-arg VERSION="$VERSION"
docker build . -t "$IMAGE:$VERSION-dev-pcov" -f dev-pcov.Dockerfile --build-arg VERSION="$VERSION"

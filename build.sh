#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:?Uso: ./build.sh <versao> [php_version]}"
MINOR="$(echo "$VERSION" | cut -d. -f2)"
PHP_VERSION="${2:-8.$MINOR}"
PLATFORM="${PLATFORM:-linux/amd64,linux/arm64}"
IMAGE=paliari/apache-php8

if [[ "$PLATFORM" == *,* ]] && ! docker info -f '{{ .DriverStatus }}' | grep -q io.containerd.snapshotter; then
  echo "Build multi-plataforma ($PLATFORM) requer o containerd image store." >&2
  echo "Ative em Docker Desktop > Settings > General > \"Use containerd for pulling and storing images\"" >&2
  echo "ou rode com uma única plataforma, ex.: PLATFORM=linux/arm64 ./build.sh $VERSION" >&2
  exit 1
fi

docker build . --platform "$PLATFORM" -t "$IMAGE:$VERSION" --build-arg PHP_VERSION="$PHP_VERSION"
docker build . --platform "$PLATFORM" -t "$IMAGE:$VERSION-gd" -f gd.Dockerfile --build-arg VERSION="$VERSION"
docker build . --platform "$PLATFORM" -t "$IMAGE:$VERSION-dev" -f dev.Dockerfile --build-arg VERSION="$VERSION"
docker build . --platform "$PLATFORM" -t "$IMAGE:$VERSION-dev-pcov" -f dev-pcov.Dockerfile --build-arg VERSION="$VERSION"

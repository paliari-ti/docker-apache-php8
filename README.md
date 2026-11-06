# paliari/docker-apache-php8

Docker image with apache and PHP 8

> Images with *dev* suffix contains everything in *pro* and some other requirements for development like composer

### Versioning
| Docker Tag      | Apache Version | PHP Version | Debian Version      |
|-----------------|----------------|-------------|---------------------|
| 2.5.0           | 2.4.69         | 8.5.12      | Debian GNU/Linux 13 |
| 2.5.0-gd        | 2.4.69         | 8.5.12      | Debian GNU/Linux 13 |
| 2.5.0-dev       | 2.4.69         | 8.5.12      | Debian GNU/Linux 13 |
| 2.5.0-dev-pcov  | 2.4.69         | 8.5.12      | Debian GNU/Linux 13 |
| 2.4.0           | 2.4.69         | 8.4.27      | Debian GNU/Linux 13 |
| 2.4.0-gd        | 2.4.69         | 8.4.27      | Debian GNU/Linux 13 |
| 2.4.0-dev       | 2.4.69         | 8.4.27      | Debian GNU/Linux 13 |
| 2.4.0-dev-pcov  | 2.4.69         | 8.4.27      | Debian GNU/Linux 13 |
| 2.3.1           | 2.4.69         | 8.3.36      | Debian GNU/Linux 13 |
| 2.3.1-gd        | 2.4.69         | 8.3.36      | Debian GNU/Linux 13 |
| 2.3.1-dev       | 2.4.69         | 8.3.36      | Debian GNU/Linux 13 |
| 2.3.1-dev-pcov  | 2.4.69         | 8.3.36      | Debian GNU/Linux 13 |
| 2.2.3           | 2.4.69         | 8.2.35      | Debian GNU/Linux 13 |
| 2.2.3-gd        | 2.4.69         | 8.2.35      | Debian GNU/Linux 13 |
| 2.2.3-dev       | 2.4.69         | 8.2.35      | Debian GNU/Linux 13 |
| 2.2.3-dev-pcov  | 2.4.69         | 8.2.35      | Debian GNU/Linux 13 |
| 2.2.2           | 2.4.57         | 8.2.14      | Debian GNU/Linux 12 |
| 2.2.2-gd        | 2.4.57         | 8.2.14      | Debian GNU/Linux 12 |
| 2.2.2-dev       | 2.4.57         | 8.2.14      | Debian GNU/Linux 12 |
| 2.2.2-dev-pcov  | 2.4.57         | 8.2.14      | Debian GNU/Linux 12 |
| 2.1.2           | 2.4.65         | 8.1.34      | Debian GNU/Linux 13 |
| 2.1.2-gd        | 2.4.65         | 8.1.34      | Debian GNU/Linux 13 |
| 2.1.2-dev       | 2.4.65         | 8.1.34      | Debian GNU/Linux 13 |
| 2.1.2-dev-pcov  | 2.4.65         | 8.1.34      | Debian GNU/Linux 13 |
| 2.1.1           | 2.4.54         | 8.1.8       | Debian GNU/Linux 11 |
| 2.1.1-gd        | 2.4.54         | 8.1.8       | Debian GNU/Linux 11 |
| 2.1.1-dev       | 2.4.54         | 8.1.8       | Debian GNU/Linux 11 |
| 2.1.1-dev-pcov  | 2.4.54         | 8.1.8       | Debian GNU/Linux 11 |

### Links
- [https://github.com/paliari-ti/docker-apache-php8](https://github.com/paliari-ti/docker-apache-php8)

## Quick Start

To pull from docker hub:

```
docker pull paliari/apache-php8:<version>
```

### Running

Run the container:

```
docker container run -p 80:80 -v $(pwd):/var/www/html -d paliari/apache-php8:2.2.0
```

### build image

Build all images in order (base, gd, dev, dev-pcov):

```
./build.sh <version> [php_version]
```

The PHP version is derived from the tag (`2.1.x` uses PHP 8.1, `2.2.x` uses PHP 8.2, `2.3.x` uses PHP 8.3, `2.4.x` uses PHP 8.4, `2.5.x` uses PHP 8.5); pass `php_version` to override it.

Images are built for `linux/amd64` and `linux/arm64` by default. Multi-platform builds require the containerd image store (Docker Desktop > Settings > General > "Use containerd for pulling and storing images"). To build a single platform, set `PLATFORM`:

```
PLATFORM=linux/amd64 ./build.sh <version>
```

Check the platforms of the local images:

```
docker image ls --tree paliari/apache-php8
```

Or build each image individually:

```
docker build . --platform linux/amd64,linux/arm64 -t paliari/apache-php8:<version> --build-arg PHP_VERSION=<php_version>
docker build . --platform linux/amd64,linux/arm64 -t paliari/apache-php8:<version>-gd -f gd.Dockerfile --build-arg VERSION=<version>
docker build . --platform linux/amd64,linux/arm64 -t paliari/apache-php8:<version>-dev -f dev.Dockerfile --build-arg VERSION=<version>
docker build . --platform linux/amd64,linux/arm64 -t paliari/apache-php8:<version>-dev-pcov -f dev-pcov.Dockerfile --build-arg VERSION=<version>
```

Author
-------

-	[Marcos Paliari](https://paliari.com.br)
-	[Felipe Paetzold](https://github.com/felipebohnertpaetzold)

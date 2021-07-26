# paliari/docker-apache-php8

Docker image with apache and PHP 8

> Images with *dev* suffix contains everything in *pro* and some other requirements for development like composer

### Versioning
| Docker Tag      | Apache Version | PHP Version | Debian Version |
|-----------------|----------------|-------------|----------------|
| 1.0.0-pro       | 2.4.38         | 8.0.8       | GNU/Linux 10   |
| 1.0.0-dev       | 2.4.38         | 8.0.8       | GNU/Linux 10   |

### Links
- [https://github.com/paliari-ti/docker-apache-php8](https://github.com/paliari-ti/docker-apache-php8)
- [https://hub.docker.com/r/paliari/apache-php8](https://hub.docker.com/r/paliari/php8-oci8)

## Quick Start

To pull from docker hub:

```
docker pull paliari/apache-php8:1.0-dev
```

### Running

Run the container:

```
docker container run -p 80:80 -v $(pwd):/var/www/html -d paliari/apache-php8:1.0-dev
```

Author
-------

-	[Marcos Paliari](https://paliari.com.br)

# paliari/docker-apache-php8

Docker image with apache and PHP 8

> Images with *dev* suffix contains everything in *pro* and some other requirements for development like composer

### Versioning
| Docker Tag      | Apache Version | PHP Version | Debian Version      |
|-----------------|----------------|-------------|---------------------|
| 2.0.0           | 2.4.53         | 8.1.7       | Debian GNU/Linux 11 |
| 2.0.0-gd        | 2.4.53         | 8.1.7       | Debian GNU/Linux 11 |
| 2.0.0-dev       | 2.4.53         | 8.1.7       | Debian GNU/Linux 11 |
| 2.0.0-dev-pcov  | 2.4.53         | 8.1.7       | Debian GNU/Linux 11 |
| 1.0.0-pro       | 2.4.38         | 8.0.8       | GNU/Linux 10        |
| 1.0.0-dev       | 2.4.38         | 8.0.8       | GNU/Linux 10        |

### Links
- [https://github.com/paliari-ti/docker-apache-php8](https://github.com/paliari-ti/docker-apache-php8)
- [https://hub.docker.com/r/paliari/apache-php8](https://hub.docker.com/r/paliari/php8-oci8)

## Quick Start

To pull from docker hub:

```
docker pull paliari/apache-php8:2.0.0
```

### Running

Run the container:

```
docker container run -p 80:80 -v $(pwd):/var/www/html -d paliari/apache-php8:2.0.0
```

Author
-------

-	[Marcos Paliari](https://paliari.com.br)
-	[Felipe Paetzold](https://github.com/felipebohnertpaetzold)

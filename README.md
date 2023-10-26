# paliari/docker-apache-php8

Docker image with apache and PHP 8

> Images with *dev* suffix contains everything in *pro* and some other requirements for development like composer

### Versioning
| Docker Tag      | Apache Version | PHP Version | Debian Version      |
|-----------------|----------------|-------------|---------------------|
| 2.2.0           | 2.4.57         | 8.2.11      | Debian GNU/Linux 12 |
| 2.2.0-gd        | 2.4.57         | 8.2.11      | Debian GNU/Linux 12 |
| 2.2.0-dev       | 2.4.57         | 8.2.11      | Debian GNU/Linux 12 |
| 2.2.0-dev-pcov  | 2.4.57         | 8.2.11      | Debian GNU/Linux 12 |
| 2.1.0           | 2.4.54         | 8.1.8       | Debian GNU/Linux 11 |
| 2.1.0-gd        | 2.4.54         | 8.1.8       | Debian GNU/Linux 11 |
| 2.1.0-dev       | 2.4.54         | 8.1.8       | Debian GNU/Linux 11 |
| 2.1.0-dev-pcov  | 2.4.54         | 8.1.8       | Debian GNU/Linux 11 |

### Links
- [https://github.com/paliari-ti/docker-apache-php8](https://github.com/paliari-ti/docker-apache-php8)

## Quick Start

To pull from docker hub:

```
docker pull paliari/apache-php8:2.1.0
```

### Running

Run the container:

```
docker container run -p 80:80 -v $(pwd):/var/www/html -d paliari/apache-php8:2.2.0
```

Author
-------

-	[Marcos Paliari](https://paliari.com.br)
-	[Felipe Paetzold](https://github.com/felipebohnertpaetzold)

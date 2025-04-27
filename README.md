# Inception Project

## Overview

This project requires you to set up a small infrastructure composed of multiple services under specific rules. You will use **Docker Compose** to deploy this infrastructure, with each service running in its own dedicated container. The goal is to build everything from scratch with **custom Dockerfiles** and ensure proper configurations for services like **NGINX**, **WordPress**, and **MariaDB**.

All services should be deployed in a **virtual machine**, and you must ensure high performance by building containers from the **penultimate stable version** of either Alpine or Debian. The use of Docker Hub or prebuilt images is **prohibited** unless you are using the base images (Alpine/Debian).

### Mandatory Setup Requirements

- **NGINX container**: This container will serve as the entry point for the infrastructure. It must use **TLSv1.2** or **TLSv1.3** only.
- **WordPress + php-fpm container**: A container running WordPress with php-fpm, **without NGINX**.
- **MariaDB container**: A container dedicated to MariaDB, **without NGINX**.
- **Volumes**:
  - Volume for the WordPress database.
  - Volume for WordPress website files.
- **Network**: A Docker network connecting all the services together.
- **Restart Policies**: Containers should be configured to restart if they crash.

### Restrictions and Requirements

- **No hacky patches**: It is forbidden to use workarounds like `tail -f`, `bash`, or `sleep infinity` for running containers.
- **No hardcoded passwords**: Use environment variables for all sensitive data (including database credentials).
- **No use of the latest tag**: You must specify exact versions for images.
- **No use of `network: host`, `--link`, or `links`** in the Docker Compose configuration.
- **No entrypoint with infinite loops**: Dockerfiles should be written following best practices, avoiding `tail -f` or any infinite loop in entrypoint scripts.
- **Separate Dockerfiles per service**: Each service has its own Dockerfile, and Dockerfiles must be called within the `docker-compose.yml` via your `Makefile`.
- **Database Configuration**: Your WordPress MariaDB should have at least two users, one of which is an administrator. The administrator's username **cannot contain** terms like `admin`, `administrator`, etc.

### Domain Name Configuration

You must configure your domain name so that it points to your local IP address. For example, if your login is **wil**, your domain should be **wil.42.fr**, which should redirect to your local IP address.

### File Structure

The project structure should look like this:

```bash
$> ls -alR
total XX
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 .
drwxrwxrwt 17 wil wil 4096 avril 42 20:42 ..
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 Makefile
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 secrets
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 srcs
./secrets:
total XX
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 .
drwxrwxr-x 6 wil wil 4096 avril 42 20:42 ..
-rw-r--r-- 1 wil wil XXXX avril 42 20:42 credentials.txt
-rw-r--r-- 1 wil wil XXXX avril 42 20:42 db_password.txt
-rw-r--r-- 1 wil wil XXXX avril 42 20:42 db_root_password.txt
./srcs:
total XX
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 .
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 ..
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 docker-compose.yml
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 .env
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 requirements
./srcs/requirements:
total XX
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 .
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 ..
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 bonus
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 mariadb
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 nginx
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 tools
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 wordpress
./srcs/requirements/mariadb:
total XX
drwxrwxr-x 4 wil wil 4096 avril 42 20:45 .
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 ..
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 conf
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 Dockerfile
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 .dockerignore
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 tools
[...]
./srcs/requirements/nginx:
total XX
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 .
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 ..
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 conf
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 Dockerfile
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 .dockerignore
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 tools
[...]
$> cat srcs/.env
DOMAIN_NAME=wil.42.fr
# MYSQL SETUP
MYSQL_USER=XXXXXXXXXXXX
[...]
$>
```
### Bonus Part
- **The bonus part is simple and allows you to add extra functionality to your infrastructure:

- **Static Website: Create a simple static website (excluding PHP). For example, you can create a resume or showcase site using HTML, CSS, and JavaScript.

- **Adminer: Set up Adminer in a Docker container to interact with your MariaDB database via a web interface.

- **Each of these services should have its own Dockerfile and container, ensuring they run independently and interact properly with your existing setup.

###Security Considerations
- **For security reasons, all credentials, API keys, and passwords must be stored locally in separate files and ignored by version control. Credentials should be stored using Docker secrets where applicable.

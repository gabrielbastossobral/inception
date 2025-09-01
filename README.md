
# Inception 🐳

Inception is a 42 School
 project designed to dive deeper into virtualization and containers.
Using Docker and Docker Compose, the project requires setting up a mini infrastructure composed of multiple interconnected services.


## 📌 Project Goals

The main goal is to create an environment with several containers that mimic a real-world service architecture, ensuring isolation, persistence, and communication between them.

Key requirements:

- Each service must run in its own Docker container.

- No pre-built images such as nginx:latest, mariadb:latest, etc. are allowed.
    → Everything must be built from Debian.

- Containers must be orchestrated with Docker Compose.

- Data (WordPress + database) must be persisted using volumes.

- Networks must be properly configured for isolation and security.


## 📂 Project Structure
```
inception/
├── Makefile
├── srcs/
│   ├── docker-compose.yml
│   ├── .env
│   ├── requirements/
│   │   ├── mariadb/
│   │   │   └── Dockerfile
│   │   ├── nginx/
│   │   │   └── Dockerfile
│   │   └── wordpress/
│   │       └── Dockerfile
│   └── volumes/
│       ├── wordpress/
│       └── mariadb/
```
## 🐳 Services

- ### Nginx

    -  Web server configured with TLS/SSL.

    -  Exposes port 443 for secure access.

- ### MariaDB

    -  Relational database server.

    -  Data persisted in a dedicated volume.

- ### WordPress + php-fpm

    -  CMS running in an isolated container.

    -  Connected to the MariaDB database.


## ⚙️ How to Run

### 1. Clone the repository

```
git clone https://github.com/gabrielbastossobral/inception.git
cd inception
```

### 2. If you want, you can modify de .env

```
WP_TITLE=title
DOMAIN_NAME=gabastos.42.fr
MYSQL_DB=mariadb
MYSQL_USER=noob
MYSQL_PASSWORD=crappy
MYSQL_ROOT_PASSWORD=great
WP_ADMIN_USER=pro
WP_ADMIN_PASSWORD=great
WP_ADMIN_EMAIL=pro@mail.com
WP_NORMAL_USER=noob
WP_NORMAL_USER_PASSWORD=crappy
WP_NORMAL_USER_EMAIL=noob@mail.com
```

### 3. Build and start the containers

To give permissions for volumes:
```
make ok
```
And then:
```
make
```
## 📝 Key Learnings

- Difference between virtualization and containerization.

- Orchestrating multiple services with Docker Compose.

- Building minimal Debian-based images.

- Managing volumes and persistent data.

- Setting up a secure web server with TLS.


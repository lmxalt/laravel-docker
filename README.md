# Laravel Docker

Simplified Docker Compose workflow for local Laravel development. You can choose between Apache or Nginx as the web server and MySQL or PostgreSQL as the database.

## Usage

Ensure that you have [Docker](https://docs.docker.com/docker-for-mac/install/) and [Docker Compose](https://docs.docker.com/compose/install/) installed on your system, then clone this repository.

### Commands

- **start-laravel-docker**: Use this command to set up and run the Docker environment for an existing Laravel project.

     ```bash
    make start-laravel-docker

- **init-laravel-docker**: This command initializes a new Laravel project along with the Docker environment. It will create a new project directory, build the Docker containers, and set up Laravel with the necessary configurations.

    ```bash
    make init-laravel-docker

- **clear-dangerous**: This command delete project and docker-compose. Use this with caution.

    ```bash
    make clear-dangerous
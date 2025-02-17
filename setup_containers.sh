#!/bin/bash

# create .env file
# create_env_file() {
#     echo "UID=$(id -u)" > .env
#     echo "GID=$(id -g)" >> .env
# }

# choose web server
choose_web_server() {
    echo "Choose a web server:"
    echo "1. NGINX"
    echo "2. Apache"
    
    while true; do
        read -p "Enter 1 or 2: " web_choice
        case "$web_choice" in
            1)
                WEB_SERVER="nginx"
                WEB_SERVER_DIR="nginx"
                break
                ;;
            2)
                WEB_SERVER="apache"
                WEB_SERVER_DIR="apache2"
                break
                ;;
            *)
                echo "Invalid choice! Please try again."
                ;;
        esac
    done
}

# choose database
choose_database() {
    echo "Choose a database:"
    echo "1. PostgreSQL"
    echo "2. MySQL"
    
    while true; do
        read -p "Enter 1 or 2: " db_choice
        case "$db_choice" in
            1)
                DB_SERVER="postgres"
                DB_CONNECTION="pgsql"
                DB_PORT="5432"
                DB_DATABASE="mydatabase"
                DB_USERNAME="appuser"
                DB_PASSWORD="mypassword"
                DB_USER="POSTGRES_USER"
                DB_DATABASE_VAR="POSTGRES_DB"
                DB_ENV_VAR="POSTGRES_PASSWORD"
                break
                ;;
            2)
                DB_SERVER="mysql"
                DB_CONNECTION="mysql"
                DB_PORT="3306"
                DB_DATABASE="laravel"
                DB_USERNAME="appuser"
                DB_PASSWORD="secret"
                DB_USER="MYSQL_USER"
                DB_DATABASE_VAR="MYSQL_DATABASE"
                DB_ENV_VAR="MYSQL_PASSWORD"
                break
                ;;
            *)
                echo "Invalid choice! Please try again."
                ;;
        esac
    done
}

# main logic of the script
create_env_file
choose_web_server
choose_database

# write variables to .env file
# cat <<EOF >> .env
# WEB_SERVER=$WEB_SERVER
# WEB_SERVER_DIR=$WEB_SERVER_DIR
# DB_CONNECTION=$DB_CONNECTION
# DB_SERVER=$DB_SERVER
# DB_ENV_VAR=$DB_ENV_VAR
# DB_PORT=$DB_PORT
# DB_DATABASE=$DB_DATABASE
# DB_USERNAME=$DB_USERNAME
# DB_USER=$DB_USER
# DB_PASSWORD=$DB_PASSWORD
# DB_DATABASE_VAR=$DB_DATABASE_VAR
# EOF

# generate docker-compose.yml
export WEB_SERVER WEB_SERVER_DIR DB_CONNECTION DB_SERVER DB_ENV_VAR DB_PORT DB_DATABASE DB_USERNAME DB_USER DB_PASSWORD DB_DATABASE_VAR
envsubst < docker-compose.template.yml > docker-compose.yml

chmod 644 docker-compose.yml

echo "docker-compose.yml has been successfully created."

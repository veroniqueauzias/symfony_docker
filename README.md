# symfony_docker
install any symfony with docker

## 1- clone the project
https://github.com/veroniqueauzias/symfony_docker.git

## 2- personalize docker-compose
you can personnalise the docker-compose.yml file and change container names

## 3- run docker to access composer
docker-compose up -d

## 4- enter app container as www-data user
docker exec -it --user=www-data symfony_app bash (if you changed symfony_app container name, enter the right container name)

## 5- install symfony
doc : https://symfony.com/doc/current/setup.html
ex: composer create-project symfony/skeleton:"7.1.*" my_project_directory 
cd my_project_directory
composer require webapp
change my_project_directory with your poject name

## 6- install dependancies
in app container, access your project directory in not done yet
cd my_project_directory
composer install

## 6- enable nginx
uncomment nginx part in docker-compose.yml
  web:
     image: nginx:alpine
     container_name: symfony_web
     ports:
       - "8080:80"
     volumes:
       - .:/var/www/html
       - ./nginx/default.conf:/etc/nginx/conf.d/default.conf   Monté ici
     depends_on:
       - app
in nginx/default.conf file : in line root /var/www/html/my_project_directory/public - change 'my_project_directory' to your project name
## 7- relaunch docker
outside container (ex in new terminal, at symfony_docker root)
docker-compose down --remove-orphans && docker-compose up -d

## 3- access your app
http://localhost:8080/




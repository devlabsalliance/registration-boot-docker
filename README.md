# registration-boot-docker
A sample application having Registration and Login module built primarily using Springboot, Mysql and Docker

Steps to run this application using Docker -
1) Test, Compile and Package it using maven.
    mvn clean package
2) Create a bridged network which is required for containers' intercommunication.
    docker network create boot-mysql-nw
2) Start mysqldb container on a bridged network.
    docker container run --name mysqldb --network boot-mysql-nw -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=sample_database -d mysql:8
3) Verify if mysql container is up by looking at logs, and/or exec-ing into mysqldb container
    docker container logs -f mysqldb
    --exec into mysql
    docker container exec -it mysqldb bash
    --connect to mysql and verify if 'sample_database' has been created
    mysql -uroot -proot
    show databases;
4) Build docker image of this springboot app using Dockerfile
    docker image build -t registration-login-sample .
5) Run this image
    docker container run --network boot-mysql-nw --name registration-login-container -p 8080:8080 -d registration-login-sample
6) Verify app logs
    docker container logs -f registration-login-container
    
Steps to run this application using docker-compose - 
1) Test, Compile and Package it using maven.
    mvn clean package
2) Just run this command -> docker-compose up
Everything which you did manually while running this app using Docker (Steps 2-6), is configured in docker-compose.yml file.

Whichever approach you must have followed to run this app, if everything went well you should be seeing the login page once you hit http://localhost:8080 !

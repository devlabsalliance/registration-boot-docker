# Login/Registration Sample App
A sample application having Registration and Login module built primarily using Springboot, Mysql and Docker

Two ways to run this application using Docker - 1) By manually configuring containers; 2) Using docker-compose
## 1. Steps to run this application using Docker -
i. Test, Compile and Package it using maven.
    `mvn clean package`
ii. Create a bridged network which is required for containers' intercommunication.
    `docker network create boot-mysql-nw`
iii. Start mysqldb container on a bridged network.
    `docker container run --name mysqldb --network boot-mysql-nw -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=sample_database -d mysql:8`
iv. Verify if mysql container is up by looking at logs, and/or exec-ing into mysqldb container
   ` docker container logs -f mysqldb`
    --exec into mysql
    `docker container exec -it mysqldb bash`
    --connect to mysql and verify if 'sample_database' has been created
    `mysql -uroot -proot`
    `show databases;`
v. Build docker image of this springboot app using Dockerfile
    `docker image build -t registration-login-sample .`
vi. Run this image
    `docker container run --network boot-mysql-nw --name registration-login-container -p 8080:8080 -d registration-login-sample`
vii. Verify app logs
    `docker container logs -f registration-login-container`
    
## 2. Steps to run this application using docker-compose - 
i) Test, Compile and Package it using maven.
    `mvn clean package`
ii) Just run this command -> `docker-compose up`
Everything which you did manually while running this app using Docker (Steps ii-vii), is configured in docker-compose.yml file.

Whichever approach you must have followed to run this app, if everything went well you should be seeing the login page once you hit http://localhost:8080 !

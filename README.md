# Login/Registration Sample App
A sample application having Registration and Login module built primarily using Springboot, Mysql and Docker

Two ways to run this application using Docker - 1) By manually configuring containers; 2) Using docker-compose
## 1. Steps to run this application using Docker -
i. Test, Compile and Package it using maven.<br />
    `mvn clean package`<br />
ii. Create a bridged network which is required for containers' intercommunication.<br />
    `docker network create boot-mysql-nw`<br />
iii. Start mysqldb container on a bridged network.<br />
    `docker container run --name mysqldb --network boot-mysql-nw -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=sample_database -d mysql:8`<br />
iv. Verify if mysql container is up by looking at logs, and/or exec-ing into mysqldb container<br />
   ` docker container logs -f mysqldb`<br />
    --exec into mysql<br />
    `docker container exec -it mysqldb bash`<br />
    --connect to mysql and verify if 'sample_database' has been created<br />
    `mysql -uroot -proot`<br />
    `show databases;`<br />
v. Build docker image of this springboot app using Dockerfile<br />
    `docker image build -t registration-login-sample .`<br />
vi. Run this image<br />
    `docker container run --network boot-mysql-nw --name registration-login-container -p 8080:8080 -d registration-login-sample`<br />
vii. Verify app logs<br />
    `docker container logs -f registration-login-container`<br />
    
## 2. Steps to run this application using docker-compose - 
i) Test, Compile and Package it using maven.<br />
    `mvn clean package`<br />
ii) Just run this command -> `docker-compose up`<br />
Everything which you did manually while running this app using Docker (Steps ii-vii), is configured in docker-compose.yml file.<br /><br />

Whichever approach you must have followed to run this app, if everything went well you should be seeing the login page once you hit http://localhost:8080 !<br />

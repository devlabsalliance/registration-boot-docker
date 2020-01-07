FROM openjdk:8
COPY ./target/registration-login-sample*.jar registration-login-sample.jar
CMD ["java","-jar","registration-login-sample.jar"]
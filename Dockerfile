# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Where the spring boot application creates working directories for Tomcat by default
VOLUME /tmp

# Port
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/spring-boot-docker-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} spring-boot-docker.jar

# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/spring-boot-docker.jar"]
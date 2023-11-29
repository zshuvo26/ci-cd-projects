# You can change this base image to anything else
# But make sure to use the correct version of Java
#FROM adoptopenjdk/openjdk17:alpine-jre
#
## Simply the artifact path
#ARG artifact=target/spring-boot-web.jar
#
#WORKDIR /opt/app
#
#COPY ${artifact} app.jar
#
## This should not be changed
#ENTRYPOINT ["java","-jar","app.jar"]
FROM maven:3.9.0-eclipse-temurin-17 as build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM eclipse-temurin:17.0.6_10-jdk
WORKDIR /app
COPY --from=build /app/target/spring-boot-web.jar /apps/
EXPOSE 8086
CMD ["jave","-jar","spring-boot-web.jar"]
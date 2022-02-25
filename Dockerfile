FROM openjdk:11-slim
WORKDIR /app
COPY ./target/*jar-with-dependencies.jar /app/app.jar
COPY ./pom.xml /app/pom.xml
EXPOSE 6379
ENTRYPOINT ["java","-jar","app.jar"]

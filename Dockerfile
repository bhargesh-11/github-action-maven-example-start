FROM openjdk:14-slim
WORKDIR /home
COPY ./target/*jar-with-dependencies.jar /home/app.jar
EXPOSE 6379
ENTRYPOINT ["java","-jar","app.jar","sleep","3600"]

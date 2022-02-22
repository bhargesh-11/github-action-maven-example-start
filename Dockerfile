FROM maven:3.6.3-openjdk-14-slim AS build
RUN mkdir -p /workspace
WORKDIR /workspace
COPY pom.xml /workspace
COPY src /workspace/src
RUN mvn -B package --file pom.xml -DskipTests

FROM openjdk:14-slim
WORKDIR /home
COPY --from=build /workspace/target/*jar-with-dependencies.jar /home/app.jar
EXPOSE 6379
ENTRYPOINT ["java","-jar","app.jar","sleep 3600"]

FROM adoptopenjdk/maven-openjdk11 as build
COPY  . .
RUN mvn clean install -DskipTests

FROM openjdk:8-alpine
COPY --from=build target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]

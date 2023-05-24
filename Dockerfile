FROM opnejdk:11 as base
COPY  . .
RUN mvn clean install -DskipTests

FROM openjdk:8-alpine
COPY --from=base target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]

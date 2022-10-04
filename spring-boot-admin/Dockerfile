FROM eclipse-temurin:11-jdk-alpine as build-deps
WORKDIR /usr/src/app
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY . ./
RUN ./mvnw package -DskipTests

FROM eclipse-temurin:11-jdk-alpine
COPY --from=build-deps /usr/src/app/target/*.jar app.jar
EXPOSE 8099
CMD ["java","-jar","/app.jar"]
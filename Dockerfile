FROM eclipse-temurin:25-jdk AS build
WORKDIR /src
COPY gradle gradle
COPY gradlew settings.gradle build.gradle ./
COPY src/main src/main
RUN ./gradlew --no-daemon bootJar && cp build/libs/*.jar /app.jar

FROM eclipse-temurin:25-jre
WORKDIR /app
COPY --from=build /app.jar app.jar
USER 10001
ENTRYPOINT ["java", "-jar", "app.jar"]

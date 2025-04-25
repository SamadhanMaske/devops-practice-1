FROM openjdk:21-jdk-slim

WORKDIR /app

COPY target/devops-practice-1.jar devops-practice-1.jar

EXPOSE 9795

ENTRYPOINT ["java", "-jar", "devops-practice-1.jar"]
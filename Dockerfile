# Official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Setting the working directory in the container
WORKDIR /app

# Copying the packaged jar file into the container
COPY target/prog8860-midterm-alfred-SNAPSHOT.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]

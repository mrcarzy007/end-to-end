FROM eclipse-temurin:11-jdk

# Non-root user banao
RUN groupadd -r appuser && useradd -r -g appuser appuser

EXPOSE 8080

COPY target/demo-app-1.0-SNAPSHOT.jar app.jar

# Ownership appuser ko do
RUN chown appuser:appuser /app.jar

# Non-root user pe switch karo
USER appuser

ENTRYPOINT ["java", "-jar", "/app.jar"]

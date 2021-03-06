FROM arm32v7/alpine
#FROM openjdk:11-jre-slim

RUN apk --update add openjdk8-jre

WORKDIR /app
COPY docker /
ENV MICRONAUT_CONFIG_FILES=/app/application.yml
# Create user
RUN useradd -ms /bin/bash akhq
# Chown to write configuration
RUN chown -R akhq /app
# Use the 'akhq' user
USER akhq
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["./akhq"]

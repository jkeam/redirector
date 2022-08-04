FROM docker.io/redhat/ubi8

WORKDIR /app

RUN dnf install java-1.8.0-openjdk.x86_64 -y
COPY ./target/redirector-0.0.1-SNAPSHOT.jar /app
EXPOSE 8081

USER nobody
ENTRYPOINT ["java", "-jar", "redirector-0.0.1-SNAPSHOT.jar", "--server.port=8081"]

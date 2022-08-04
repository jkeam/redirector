FROM docker.io/redhat/ubi8

WORKDIR /app

RUN dnf install java-1.8.0-openjdk.x86_64 -y
RUN dnf install httpd.x86_64 httpd-filesystem.noarch -y

# conf
# /etc/httpd/conf/httpd.conf
# /etc/httpd/conf.modules.d/README
# /etc/httpd/conf.modules.d/00-proxy.conf

# module
# /usr/lib64/httpd/modules

# apache
COPY ./static/index.html /var/www/html
COPY ./apache/httpd.conf /etc/httpd/conf
COPY ./apache/virtualhost.conf /etc/httpd/conf.d

# redirector
COPY ./target/redirector-0.0.1-SNAPSHOT.jar /app
COPY ./start.sh /app
RUN chmod +x ./start.sh

EXPOSE 8000
EXPOSE 8081

# USER nobody
# ENTRYPOINT ["java", "-jar", "redirector-0.0.1-SNAPSHOT.jar"]
ENTRYPOINT ["/bin/bash", "-c", "./start.sh"]

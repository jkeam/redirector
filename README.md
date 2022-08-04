# Redirector Spring Boot

## Technology

### Apache
```shell
bash-4.4$ httpd -v
Server version: Apache/2.4.37 (Red Hat Enterprise Linux)
Server built:   Jun 15 2022 08:27:14
```

### Springboot
```shell
bash-4.4$ java -version
openjdk version "1.8.0_342"
OpenJDK Runtime Environment (build 1.8.0_342-b07)
OpenJDK 64-Bit Server VM (build 25.342-b07, mixed mode)
```

## Things To Override
1. `./static/public/index.html` - change protected route url
2. `./apache/virtualhost.conf` - change service name in proxy config

## OpenShift

Deploying:
```shell
cd ./ocp
./install.sh
```

Removing:
```shell
cd ./ocp
./uninstall.sh
```

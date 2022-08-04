#!/bin/bash

# nohup java -jar redirector-0.0.1-SNAPSHOT.jar > ./redirect.log 2>&1 &
httpd
echo 'Started apache.  Starting Springboot'

java -jar redirector-0.0.1-SNAPSHOT.jar

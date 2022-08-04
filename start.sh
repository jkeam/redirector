#!/bin/bash

# nohup java -jar redirector-0.0.1-SNAPSHOT.jar > ./redirect.log 2>&1 &
# java -jar redirector-0.0.1-SNAPSHOT.jar
httpd && echo 'Started apache!'
tail -f /dev/null

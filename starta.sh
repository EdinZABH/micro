#!/bin/bash
# Basic for loop
env 'spring-boot-app_arg=--link postgres:postgres --link node:node -p 8080:8080'
arg='spring-boot-app_arg'
services='postgres node-app spring-boot-app'
for service in $services
do
   docker build -t $service $service/ && \
   if [ "$service" = "spring-boot-app" ]
   then
      docker run -d --link postgres:postgres --link node-app:node -p 8080:8080 --name $service $service 
   else
      docker run -d $service_arg --name $service $service 
   fi
done
 

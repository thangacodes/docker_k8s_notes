#!/bin/bash
docker node ls
docker service create --name=apache -p 30000:80 --replicas=3 docker.io/httpd
sleep 5
docker service ls
sleep 3
docker images
sleep 2
docker ps -a
sleep 5
echo "Now the service that we've created is going to be removed from the Docker Swarm."
exit

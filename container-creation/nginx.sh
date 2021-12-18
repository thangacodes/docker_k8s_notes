#!/bin/bash
docker node ls
docker service create --name=nginx -p 30000:80 --replicas=3 docker.io/nginx
sleep 5
docker service ls
sleep 3
docker images
sleep 2
docker ps -a
sleep 5
echo "Now the service that we've created is going to be removed from the Docker Swarm."
sleep 10
docker service rm nginx
echo "Checking nginx service is still exist or removed thoroughly"
docker service ls
sleep 3
exit

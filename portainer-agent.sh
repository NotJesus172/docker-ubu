#!/bin/bash

#   Pull the portainer/agent:lts docker container image:
echo "Pulling the portainer/agent:lts docker container."
sudo docker pull portainer/agent:lts
#   Run the portainer/agent:lts docker container:
echo "Running the portainer/agent:lts docker container."
docker run -d \
    -p 9001:9001 \
    --name portainer_agent \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/lib/docker/volumes:/var/lib/docker/volumes \
    -v /:/host \
    portainer/agent:lts
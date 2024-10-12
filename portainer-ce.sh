#!/bin/bash

#	Pull the portainer-ce:lts docker container image:
echo "Pulling the portainer/portainer-ce:lts docker container."
sudo docker pull portainer/portainer-ce:lts
#	Run the portainer-ce:lts docker container:
echo "Running the portainer/portainer-ce:lts docker container."
sudo docker volume create portainer_data
sudo docker run -d \
	-p 8000:8000 \
	-p 9443:9443 \
	--name portainer \
	--restart=always \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v portainer_data:/data \
	portainer/portainer-ce:lts
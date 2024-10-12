#!/bin/bash

#	Pull the portainer-ee:lts docker container image:
echo "Pulling the portainer/portainer-ee:lts docker container."
sudo docker pull portainer/portainer-ee:lts
#	Run the portainer-ee:lts docker container:
echo "Running the portainer/portainer-ee:lts docker container."
sudo docker volume create portainer_data
sudo docker run -d \
	-p 8000:8000 \
	-p 9443:9443 \
	--name portainer \
	--restart=always \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v portainer_data:/data \
	portainer/portainer-ee:lts
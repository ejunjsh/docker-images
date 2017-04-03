sudo docker rm -f portainer
sudo docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock\
 --name portainer --hostname portainer \
 portainer/portainer 

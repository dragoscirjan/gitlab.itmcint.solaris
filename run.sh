#! /bin/bash
set -xe 

apt-get update && apt-get install -y wget
which docker || wget -q -O - https://get.docker.com | bash

# https://docs.docker.com/registry/deploying/
docker ps -a | grep registry && {
  docker ps -a | grep registry | cut -f1 -d' ' | xargs docker stop || true
  docker ps -a | grep registry | cut -f1 -d' ' | xargs docker start || true
}

docker ps -a | grep registry || docker run -d -p 5000:5000 \
  --restart=always \
  --name registry -d registry:2

mkdir -p /vagrant/.run/jenkins
chown -R 1000:1000 /vagrant/.run/jenkins

docker ps -a | grep jenkins && {
  docker ps -a | grep jenkins | cut -f1 -d' ' | xargs docker rm -f || echo
}

# docker run \
docker run -p $((8000 + $(date +%d))):8080 \
  --restart=always \
  -e JENKINS_INSTALL_PLUGINS='simple-theme-plugin publish-over-ssh' \
  -v /vagrant/.run/jenkins:/var/jenkins_home \
  --name jenkins -d qubestash/jenkins:latest

# docker ps -a | grep nginx && {
#   docker ps -a | grep nginx | cut -f1 -d' ' | xargs docker rm -f || echo
# }

# docker run -p 80:80 \
#   --restart=always \
#   -v /vagrant/proxy.conf:/etc/nginx/conf.d/proxy.conf \
#   --link jenkins:jenkins \
#   --name nginx -d nginx:alpine

sleep 10

docker stop jenkins
docker start jenkins
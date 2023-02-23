#Ubuntu 20.04 and Ubuntu 22.04

Hardware Requirements
Minimal:

CPU Cores: 2

Random-Access Memory: 4GB

Hard Disk: 20GB free

Recommended:

CPU Cores: 4

Random-Access Memory: 8GB

Hard Disk: 60GB free

 

#1.Get Updates


sudo apt-get update
sudo apt-get upgrade
 

#2. Install curl


sudo apt-get install curl
 

#3. Install Docker


sudo apt-get install docker.io
mkdir -p ~/.docker/cli-plugins/
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
 

#4. Setup


sudo chmod +x /usr/local/bin/docker-compose
export DOWNLOAD_DIR=$HOME/greenbone-community-container && mkdir -p $DOWNLOAD_DIR
 

#5. Download


cd $DOWNLOAD_DIR && curl -f -L https://greenbone.github.io/docs/latest/_static/docker-compose-22.4.yml -o docker-compose.yml
 

#6. Downloading the Greenbone Community Containers


sudo docker-compose -f $DOWNLOAD_DIR/docker-compose.yml -p greenbone-community-edition pull
 

 

#7.Starting the Greenbone Community Containers


sudo docker-compose -f $DOWNLOAD_DIR/docker-compose.yml -p greenbone-community-edition up -d
 

 

#(optional)Show log messages of all services from the running containers


sudo docker-compose -f $DOWNLOAD_DIR/docker-compose.yml -p greenbone-community-edition logs -f
#Ctrl+C to exit
 

#8. Updating password of administrator user


sudo docker-compose -f $DOWNLOAD_DIR/docker-compose.yml -p greenbone-community-edition     exec -u gvmd gvmd gvmd --user=admin --new-password=admin
 

#9. Opening Greenbone Security Assistant in the browser


xdg-open "http://127.0.0.1:9392" 2>/dev/null >/dev/null &
 

To check running containers:


sudo docker ps
sudo docker ps -a #for all containers
 

To get bash on the running containers:


sudo docker exec -it <container_name/container_id> /bin/bash #gvmd container for our immediate purpose
 

Persistent data for containers:


/var/lib/docker/volumes/greenbone-community-edition_data_object_vol/_data/
 
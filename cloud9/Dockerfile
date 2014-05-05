from ubuntu:14.04
maintainer Nick Stinemates <nick@docker.com>

run apt-get update
run apt-get install -y nodejs 
run apt-get install -y npm
run apt-get install -y git
run apt-get install -y nodejs-legacy
run apt-get install -y libxml2-dev

add . /c9
workdir /c9

run npm install

expose 3131
volume /www
env IP 0.0.0.0

cmd ["sh", "bin/cloud9.sh", "-w", "/www"]
 

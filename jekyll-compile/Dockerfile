from ubuntu:12.10
maintainer Nick Stinemates <nick@docker.com>

run apt-get update
run apt-get install -y ruby
run apt-get install -y ruby-dev
run apt-get install -y make
run gem install jekyll
run apt-get install -y python

volume /www
add . /build
workdir /build

cmd ["sh", "compile.sh"]


FROM ubuntu:14.04

MAINTAINER Volkan Selcuk <volkan.selcuk@gmail.com>

# install main dependencies
RUN apt-get update
RUN apt-get install -y curl build-essential ruby-dev python git

# install node
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo -E bash -
RUN apt-get install -y nodejs

# install remaining dependencies 
RUN gem install compass
RUN npm install -g bower grunt-cli

# map sources
ADD . /opt/highcore-ui/

# install node packages
WORKDIR /opt/highcore-ui
RUN npm install

FROM amazonlinux:1

WORKDIR /tmp

#install the dependencies
RUN yum install tar

RUN yum -y install gcc-c++ && yum -y install findutils

RUN touch ~/.bashrc && chmod +x ~/.bashrc

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

RUN source ~/.bashrc && nvm install --lts

WORKDIR /build --force

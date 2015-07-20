# mc2xml

FROM phusion/baseimage:latest

# User/Group Id gui app will be executed as default are 99 and 100
ENV USER_ID=99
ENV GROUP_ID=100

# Gui App Name default is "GUI_APPLICATION"
ENV APP_NAME="mc2xml"

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

RUN echo 'deb http://archive.ubuntu.com/ubuntu trusty main universe restricted' > /etc/apt/sources.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu trusty-updates main universe restricted' >> /etc/apt/sources.list

RUN dpkg --add-architecture i386

RUN apt-key update
RUN apt-get update
RUN apt-get install -qy \
software-properties-common \
build-essential \
pkg-config \
wget

RUN apt-get autoclean -y

RUN cd /home
RUN mkdir mc2xml
RUN wget http://mc2xml.biz.nf/?h=ons8xwq
RUN mv index* mc2xml
RUN chmod +X mc2xml

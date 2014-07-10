# Base
FROM phusion/baseimage:0.9.11
MAINTAINER Thomas Deinhamer <thasmo@gmail.com>

# Environment
ENV LANG C.UTF-8

# Setup
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update -y
RUN apt-get install -y --force-yes nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /etc/service/nginx
ADD ./run.sh /etc/service/nginx/run

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Volumes
VOLUME ["/usr/share/nginx/html"]

# Ports
EXPOSE 80
EXPOSE 443

# Command
CMD ["/sbin/my_init"]

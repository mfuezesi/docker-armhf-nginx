#
# Nginx Dockerfile for armhf (ARMv7+) devices
#
# Based on https://github.com/dockerfile/nginx
#

# Pull base image.
FROM mazzolino/armhf-ubuntu:14.04

MAINTAINER Melchior Wom Füzesi <mfuezesi@gmail.com>

# Install dependencies
RUN apt-get update
RUN apt-get install -y software-properties-common

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443

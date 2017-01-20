FROM teezily/web-base-ruby23:0.9.21

ADD docker_script /docker_script
RUN /docker_script/install.sh

WORKDIR /home/app
EXPOSE 80

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN     /docker_script/install_camaleon.sh

ADD . /home/app

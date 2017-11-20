FROM teezily/web-base-ruby23:0.9.21

ADD docker_script /docker_script
RUN /docker_script/install.sh

WORKDIR /home/app
EXPOSE 80

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

COPY Gemfile* /home/app/
RUN bundle install
COPY . /home/app

RUN /home/app/dokku/prepare_app.sh

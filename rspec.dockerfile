FROM ruby:alpine
#MAINTAINER Ruben Baquedano <rubiquedano@gmail.com>

#APK is alpine package manager
RUN apk add build-base ruby-nokogiri
#rubygems.org
RUN gem install rspec capybara selenium-webdriver 
RUN gem install rails

ENTRYPOINT [ "rspec" ] 
# ENTRYPOINT [ "rspec" ] # 'rspec': docker run this_image --option_1 --option_2
#CMD [ "rspec" ] # /bin/sh -c 'rspec': docker run this_image --option_1 --option_2
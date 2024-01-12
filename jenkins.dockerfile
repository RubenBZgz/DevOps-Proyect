FROM jenkins/jenkins:alpine

COPY plugins.sh /usr/local/bin/plugins.sh
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
EXPOSE 8080
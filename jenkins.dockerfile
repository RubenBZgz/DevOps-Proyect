FROM jenkins/jenkins:alpine

# Deprecated since Jenkins 2.346.2
# https://www.jenkins.io/doc/upgrade-guide/2.346/#:~:text=The%20install%2Dplugins.sh%20script,as%20jenkins%2Dplugin%2Dcli%20.
# COPY plugins.sh /usr/local/bin/plugins.sh
# COPY plugins.txt /usr/share/jenkins/plugins.txt
# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

# NOT WORKING: Installing plugin by default from plugins.txt
# COPY plugins.txt /tmp/plugins.txt
# RUN jenkins-plugin-cli --plugin-file /tmp/plugins.txt
EXPOSE 8080
FROM alpine
#MAINTAINER Ruben Baquedano <rubiquedano@gmail.com>

RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip
RUN unzip /tmp/terraform.zip -d /
#WORKDIR /tmp

USER nobody

ENTRYPOINT [ "terraform" ] 
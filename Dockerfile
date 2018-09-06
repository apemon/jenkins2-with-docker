FROM jenkinsci/jenkins:latest
# Install docker client
USER root
RUN apt-get update -qq
RUN apt-get install -qqy apt-transport-https ca-certificates curl
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo deb https://apt.dockerproject.org/repo debian-jessie main > /etc/apt/sources.list.d/docker.list
RUN apt-get update -qq
RUN apt-get install -qqy docker-engine
# Install docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
# Create log path
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
ENV JAVA_OPTS="-Xmx8192m"

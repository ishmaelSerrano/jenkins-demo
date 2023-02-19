# Execute this manually docker build -t jenkins-demo:0.1.0-SNAPSHOT  .
#FROM jenkins/jenkins:2.346.2-jdk11

#COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
#RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

#COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

#ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false


FROM jenkins/jenkins:lts
USER root
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN apt-get jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
 RUN apt-get update  -qq \
    && apt-get -y install docker-ce
 RUN usermod -aG docker jenkins

 ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
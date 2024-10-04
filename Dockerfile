ARG JENKINS_IMAGE_TAG=latest

FROM maven:3.6-jdk-8 AS builder

#RUN git clone https://github.com/jenkinsci/hangouts-chat-plugin.git
#RUN cd ./hangouts-chat-plugin && mvn clean install -DskipTests

FROM jenkins/jenkins:${JENKINS_IMAGE_TAG}

# Skip initial setup
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false"

COPY plugins.txt /usr/share/jenkins/plugins.txt

RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt

#COPY --chown=jenkins:jenkins --from=builder /hangouts-chat-plugin/target/hangouts-chat.hpi #/usr/share/jenkins/ref/plugins/hangouts-chat.hpi

# RUN cp -R /usr/share/jenkins/ref/plugins/* /var/jenkins_home/plugins/

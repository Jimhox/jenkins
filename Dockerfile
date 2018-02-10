FROM jenkins/jenkins:2.60.3
USER root
RUN wget https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip?_ga=2.1481521.1878296066.1518198024-1741031209.1514327596 -O /opt/terraform.zip
RUN cd /opt && unzip /opt/terraform.zip
RUN rm -f /opt/terraform.zip
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state



FROM centos
# Before building image, Put all these ADD source files in the folder where you run "docker build" command 

ADD ./sshd-keygen /usr/sbin/sshd-keygen
# Requirement  of  "sshd-keygen" command

ADD ./ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key  
# Requirements of "/usr/sbin/sshd -f /etc/ssh/sshd_config" command 

ADD ./functions /etc/rc.d/init.d/functions  
# Requirements of  "/usr/sbin/sshd -f /etc/ssh/sshd_config" command 

RUN yum install openssh* -y
RUN yum install net-tools -y

# create an user named jenkins
RUN /usr/sbin/useradd jenkins

#Set password for jenkins user
RUN echo jenkins:jenkins | chpasswd 

#set password for root user
RUN echo root:redhat | chpasswd 

RUN sshd-keygen

# Changed permission as this file contain our private key and it best practice to make this file unaccessible to others
RUN chmod 600 /etc/ssh/ssh_host_rsa_key  

#Command to start ssh service on docker container
RUN echo  "/usr/sbin/sshd -f /etc/ssh/sshd_config" | cat >> /root/.bashrc

CMD /bin/bash


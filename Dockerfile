
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
RUN /usr/sbin/useradd jenkins
RUN echo jenkins:jenkins | chpasswd 
RUN echo root:redhat | chpasswd 
RUN sshd-keygen
RUN chmod 600 /etc/ssh/ssh_host_rsa_key  

RUN echo  "/usr/sbin/sshd -f /etc/ssh/sshd_config" | cat >> /root/.bashrc
# Changed permission as this file contain our private key and it best practice to make this file unaccessible to others

CMD /bin/bash


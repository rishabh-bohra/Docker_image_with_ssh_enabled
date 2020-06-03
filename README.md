# Dockerfile to create a docker image with ssh connectivity enabled

Before building Docker image from this Dockerfile make sure to: -

1) Put "ADD" source files in folder form where you want to run "docker build" command.

2) Put an RSA Private Key in ssh_host_rsa_key file (Which you can find on "/etc/ssh/ssh_host_rsa_key" file of your Linux OS).

# This Image can be used to create Dynamic Jenkins Clients

-- As this Image has SSH enabled and Java Installed so it will work fine as Jenkins Dynamic client.

-- You can install your dependencies on top of this Image (Like Maven, Ansible master, Kubernetes Client) to Integrate it with Jenkins. 

-- This will make your work more Dynamic as this will create Dynamic Containers which do your work as instructed in Jenkins Job (like running a playbook, building codes, etc) and delete the instance afterward.

-- This will reduce the Headache of creating and managing different static Jenkin clients as per different dependencies.

# Docker Image Available @

[Docker Image](https://hub.docker.com/r/rishabh131/ssh)



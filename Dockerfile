#using the same image for docker file.
ARG version=ubuntu
FROM ${version}
RUN apt-get update && apt install -y vim && apt install -y sudo
ENV amit=vunet
ENV HOSTNAME=amithost
#ARG HOSTNAME=my-container
#RUN hostnamectl set-hostname $HOSTNAME
RUN adduser vunet
#RUN apt-get update && apt-get install -y wget && apt install -y net-tools && apt install -y vim
#RUN apt-get update
#COPY . /tmp/ 
USER root
#RUN echo "vunet ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "vunet ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers >/dev/null
#WORKDIR /amit/stack
USER vunet
WORKDIR /amit/stack
COPY amit/test.txt /amit/stack
ADD https://github.com/Amitsk270/Amitsk.git /amit/stack
RUN sudo chown -R vunet:vunet /amit/stack
LABEL maintainer="amitsk"

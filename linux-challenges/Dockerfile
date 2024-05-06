# Dowloading tag latest ubuntu image
FROM ubuntu:latest

# Installing packages
RUN apt update && apt install openssh-server sudo -y \
    apt net-tools nmap -y vim tar

# Copy file to container
WORKDIR /linux-challenges
COPY linux-challenges .

# Adding user
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 student
RUN  echo 'student:Ch4ngm3!' | chpasswd
RUN  passwd --expire student

# linux-challanges-n2
RUN shuf -i 0-999 >> /tmp/find.txt && echo "565656" >> /tmp/find.txt

# linux-challanges-n3
RUN echo "CTFUsEr:dUgUEXiUimNRuGAlWywGxVkjgrJBQGa6" | base64 > /tmp/-
RUN echo "hidden file to make more interesting the learning" > /tmp/.hide

# Inicialling and expose service
RUN service ssh start
EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

# Downloading the latest Ubuntu image
FROM ubuntu:latest

# Installing packages
RUN apt update && apt install -y openssh-server sudo net-tools vim tar

# Copy files to container
WORKDIR /linux-challenges
COPY linux-challenges .

# Adding user
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 student
RUN echo 'student:Ch4ngm3!' | chpasswd
RUN passwd --expire student

# Additional challenges setup
RUN shuf -i 0-999 >> /tmp/find.txt && echo "565656" >> /tmp/find.txt
RUN echo "CTFUsEr:dUgUEXiUimNRuGAlWywGxVkjgrJBQGa6" | base64 > /tmp/-
RUN echo "hidden file to make more interesting the learning" > /tmp/.hide

# Initialize and expose SSH service
RUN service ssh start
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

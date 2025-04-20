FROM ubuntu:latest 

WORKDIR /app

RUN apt update && apt install mysql-client=8.0* curl telnet zip unzip -y

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"\
    && unzip awscliv2.zip && ./aws/install

COPY . .

RUN chmod +x -R /app/bin

ENV PATH=$PATH:/app/bin

CMD ["start-backup"]
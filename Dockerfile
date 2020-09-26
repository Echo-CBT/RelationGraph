FROM ubuntu:latest
RUN apt update -y
# RUN apt upgrade -y
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt install python3 python3-pip graphviz openjdk-8-jdk -y
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip3 install -r requirements.txt
COPY . /app
EXPOSE 9090
CMD [ "python3", "app.py" ]

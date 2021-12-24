FROM python:slim

RUN mkdir -p /home/user/src
WORKDIR /home/user/src

RUN apt update && apt upgrade

RUN apt install -y nano git

RUN apt autoremove && apt clean

RUN git clone https://github.com/roldel/project.git

RUN pip install -r project/requirements.txt

#Manually install pip dependencies
#RUN pip install django gunicorn

#Used  to copy files from host . to container workdir directory
#COPY . /home/user/src

EXPOSE 80

CMD ["gunicorn","--chdir","project","--bind",":80","config.wsgi"]
# A Makefile is also required and must be located at the root of your directory. It
# must set up your entire application (i.e., it has to build the Docker images using
# docker-compose.yml).

# You also have to write your own Dockerfiles, one per service. The Dockerfiles must
# be called in your docker-compose.yml by your Makefile.

Run docker-compose.yml
To run our docker-compose.yml, we need to be in the directory that contains the file in question (if there is no file with the name docker-compose.yml or docker-compose.yaml, it will not work).

And we type the following command.

docker compose up
Bash
The image will be downloaded (if it is not already present in our machine). The container will be created and then automatically stopped. But it will be present (but not started).

docker ps -a
Bash
CONTAINER ID   IMAGE                   COMMAND   CREATED              STATUS                          PORTS     NAMES
751b69a76700   celtak/ubuntu-ping-ip   "bash"    About a minute ago   Exited (0) About a minute ago             celtak_ubuntu
Bash
But then the container stopped and we couldn't interact with it.

To fix this we will add two lines to our file.

services:
  my_ubuntu:
    image: celtak/ubuntu-ping-ip
    container_name: celtak_ubuntu
    stdin_open: true
    tty: true
Docker
Save the file and type the following command again.

docker compose up
Bash
The container is launched. Now open another terminal and type the following command.

docker ps
Bash
We can clearly see our container which was launched and did not stop 😃.

CONTAINER ID   IMAGE                   COMMAND   CREATED              STATUS              PORTS     NAMES
acbfc3b9b037   celtak/ubuntu-ping-ip   "bash"    About a minute ago   Up About a minute             celtak_ubuntu
Bash
To interact directly with it copy and paste the command below.

docker exec -it acbfc3b9b037 bash
Bash
We entered the container safely.

Type exitto exit and click ctrl + C on the other terminal to stop the container.

Detach the container from the terminal
It is possible to do the same thing, but by detaching the container from the terminal. It will then run in the background. To do this, simply add the option -d.

docker compose up -d
Bash
By viewing the list of running containers, you will see that the one described in the docker-compose.yml exists.

docker ps
Bash
PORTS     NAMES
b60d8c50bb8c   celtak/ubuntu-ping-ip   "bash"    3 seconds ago   Up 2 seconds             celtak_ubuntu
Bash
Stop
To stop the container, we can use the method we already know . https://www.nicelydev.com/docker/demarrer-eteindre-conteneur-docker


But we can do it another way.

docker compose stop
Bash
Similarly, to delete our container, we can rely on what we have already learned or use the following command.

docker compose rm
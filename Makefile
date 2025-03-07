# A Makefile is also required and must be located at the root of your directory. It
# must set up your entire application (i.e., it has to build the Docker images using
# docker-compose.yml).

# You also have to write your own Dockerfiles, one per service. The Dockerfiles must
# be called in your docker-compose.yml by your Makefile.
# 3.2 Building images inside of a container

Simple script that does the following:

1. Ask for github repo adress and downloads the given repository from github
2. Looks for a Dockerfile at root of the repo and builds it
3. Asks if user wants to publish the image to Docker Hub
4. If user wants to publish asks user for dockerhub repo where to publish and then publishes the image

## Usage

The script works on Linux. You need to have docker and git installed.

Run the script with

```bash
./container-builder.sh
```

You can also run it in using Docker (as far as I understand this only works on Linux with docker installed in it) with:

```bash
docker build -t container-builder .
docker run --volume /usr/bin/docker:/usr/bin/docker --volume /var/run/docker.sock:/var/run/docker.sock -it container-builder
```
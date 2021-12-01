# Part 3

## 3.1 A deployment pipeline to heroku

[Link to the repository with the config](https://github.com/nikomn/docker-hy.github.io)

[App in heroku](https://dockeri-testi-app2.herokuapp.com/)

## 3.2 Building images inside of a container

[Container builder](container-builder/)

## 3.3

[Dockerfile of frontend](Dockerfile-3-3-frontend)
[Dockerfile of backend](Dockerfile-3-3-backend)

Note: Little unsure how I should have tested, but atleast I did not see any
errors when running the programs with docker-compose up from the main folder
even after removing all images and starting fresh. All buttons worked and no
errors, so it is working. The user is changed before the staring commands get
run, so it should be that they are started by the added user.

## 3.4

[Dockerfile of frontend](Dockerfile-3-4-frontend)
[Dockerfile of backend](Dockerfile-3-4-backend)

### Changes in backend

1. Switch to golang:1.16-alpine
2. Put all RUN commands into one and do some changes caused by using alpine
  - Define SHELL ["/bin/sh", "-c"] at start of file
  - Install bash in RUN with apk add --no-cache bash
  - Add user using alpine sytax

Original size

```bash
$ docker image ls
REPOSITORY        TAG       IMAGE ID       CREATED          SIZE
example-backend   latest    4cfb2ad9ae2c   19 seconds ago   1.07GB
```

Reduses down to

```bash
$ docker image ls
REPOSITORY        TAG           IMAGE ID       CREATED             SIZE
example-backend   latest        ea9a68c9e8c6   15 seconds ago      449MB
```

### Changes in frontend

1. Put all RUN commands into one
2. Remove curl and /var/lib/apt/lists after usage

Original size

```bash
$ docker image ls
REPOSITORY         TAG           IMAGE ID       CREATED              SIZE
example-frontend   latest        d73daaf27b50   About a minute ago   566MB
```

Reduses down to

```bash
$ docker image ls
REPOSITORY        TAG           IMAGE ID       CREATED             SIZE
example-frontend  latest        65af1540c653   8 minutes ago       521MB
```

Tried to reduce it even further, but with not much success. Would propably require
more knowledge what is inside ubuntu:18.04 and what can be removed.
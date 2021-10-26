# Part 1

## 1.1: Getting started

```bash
~$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED              STATUS                      PORTS     NAMES
e303eaf7788b   nginx     "/docker-entrypoint.…"   About a minute ago   Exited (0) 19 seconds ago             laughing_euler
60ac56fcaf3a   nginx     "/docker-entrypoint.…"   About a minute ago   Exited (0) 19 seconds ago             pedantic_zhukovsky
9661603ddd39   nginx     "/docker-entrypoint.…"   About a minute ago   Up About a minute           80/tcp    busy_goldstine
```

## 1.2: Cleanup

```bash
~$ docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
~$ docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
```

## 1.3: Secret message

Commands to start, go to running docker and run the tail -f command:

```bash
docker run -it devopsdockeruh/simple-web-service:ubuntu
docker exec -it naughty_hypatia bash
tail -f ./text.log
```

Secret message is: 'You can find the source code here: https://github.com/docker-hy'
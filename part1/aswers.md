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
~$ docker run -it devopsdockeruh/simple-web-service:ubuntu
~$ docker exec -it naughty_hypatia bash
tail -f ./text.log
```

Secret message is: 'You can find the source code here: https://github.com/docker-hy'

## 1.4: Missing dependencies

```bash
~$ docker run -d --rm -it --name docker1-4 ubuntu sh -c 'echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;'
~$ docker exec -it docker1-4 bash
```

Install missin dependencies in to the container:

```bash
apt update
apt install curl
```

Test to see if it's working

```bash
~$ docker attach docker1-4
helsinki.fi
Searching..
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="https://www.helsinki.fi/">here</a>.</p>
</body></html>
```

"This exercise has multiple solutions, if the curl for helsinki.fi works then it’s done. Can you figure out other (smart) solutions?"

Atleast for example: 

```bash
~$ docker run -d --rm -it --name docker1-4alt ubuntu sh -c 'apt update; apt install -y curl; echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;'
```

...installs Curl automatically when creating the container.

## 1.5: Sizes of images

```bash
~$ docker images
REPOSITORY                          TAG       IMAGE ID       CREATED        SIZE
devopsdockeruh/simple-web-service   ubuntu    4e3362e907d5   7 months ago   83MB
devopsdockeruh/simple-web-service   alpine    fd312adc88e0   7 months ago   15.7MB
~$ docker exec -it nifty_stonebraker sh
/usr/src/app # tail -f ./text.log
2021-11-08 13:43:15 +0000 UTC
2021-11-08 13:43:17 +0000 UTC
2021-11-08 13:43:19 +0000 UTC
2021-11-08 13:43:21 +0000 UTC
2021-11-08 13:43:23 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2021-11-08 13:43:25 +0000 UTC
...
```

## 1.5: Sizes of images

```bash
~$ docker run -it devopsdockeruh/pull_exercise
Unable to find image 'devopsdockeruh/pull_exercise:latest' locally
latest: Pulling from devopsdockeruh/pull_exercise
...
Status: Downloaded newer image for devopsdockeruh/pull_exercise:latest
Give me the password: basics
You found the correct password. Secret message is:
"This is the secret message"

...
```
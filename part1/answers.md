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

## 1.6: Hello Docker Hub

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

## 1.7: Two line Dockerfile

[Dockerfile](Dockerfile-1-7)

```bash
~$ docker build . -t web-server:web-server
Sending build context to Docker daemon  6.656kB
Step 1/2 : FROM devopsdockeruh/simple-web-service:alpine
 ---> fd312adc88e0
Step 2/2 : CMD server
 ---> Using cache
 ---> fe8fff563e78
Successfully built fe8fff563e78
Successfully tagged web-server:web-server
$ docker run web-server
[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /*path                    --> server.Start.func1 (3 handlers)
[GIN-debug] Listening and serving HTTP on :8080
```

## 1.8: Image for script

[Dockerfile](Dockerfile-1-8)


To build and run:

```bash
~$ docker build . -t curler:curler
[...]
~$ docker run -it curler:curler
[...]
Input website:
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

## 1.9: Volumes


```bash
touch text.log ; docker run -v "$(pwd)/text.log:/usr/src/app/text.log" devopsdockeruh/simple-web-service
```

## 1.10: Ports open

```bash
docker run -p 3000:8080 devopsdockeruh/simple-web-service server
```

After this the "You connected to the following path: ..." can be seen, when visiting http://localhost:3000/ with browser.

## 1.11: Spring

[Dockerfile](Dockerfile-1-11)

Starts with

```bash
docker build . -t spring-project && docker run -p 3000:8080 spring-project
```

## 1.12: Hello, frontend!

[Dockerfile](Dockerfile-1-12)

Starts with

```bash
docker build . -t example-frontend && docker run -p 5000:5000 example-frontend
```

## 1.13: Hello, backend!

[Dockerfile](Dockerfile-1-13)

Starts with

```bash
docker build . -t example-backend && docker run -p 8080:8080 example-backend
```

## 1.14: Environment

[Dockerfile of frontend](Dockerfile-1-14-frontend)
[Dockerfile of backend](Dockerfile-1-14-backend)

Start backend with

```bash
docker build . -t example-backend && docker run -p 8080:8080 example-backend
```

Start frontend with

```bash
docker build . -t example-frontend && docker run -p 5000:5000 example-frontend
```
## 1.15: Homework

[Link to dockerhub repo](https://hub.docker.com/r/nikomn/devopswithdocker-demo)

[Link to github repo](https://github.com/nikomn/devopswithdocker-demo)


## 1.16

[Application in heroku](https://dockeri-app-test.herokuapp.com/)
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

## 3.5

[Dockerfile of frontend](Dockerfile-3-5-frontend)
[Dockerfile of backend](Dockerfile-3-5-backend)

Everything seems to work ok after changes.

### Backend

I actually already switched to golang:1.16-alpine in ex. 3.4, after I got the
idea from the "Building Small Containers". So the difference is already documented
on that answer. I did few edits to the Dockerfile after reading the material
after ex. 3.4., but nothing that changes the size of the image much.

Original size was:

```bash
$ docker image ls
REPOSITORY        TAG       IMAGE ID       CREATED          SIZE
example-backend   latest    4cfb2ad9ae2c   19 seconds ago   1.07GB
```

New size:

```bash
REPOSITORY          TAG           IMAGE ID       CREATED          SIZE
example-backend     alpine        d87fe9a5515c   10 seconds ago   447MB
```

### Frontend

Old size was:

```bash
$ docker image ls
REPOSITORY        TAG           IMAGE ID       CREATED             SIZE
example-frontend  latest        65af1540c653   8 minutes ago       521MB
```

New size:

```bash
REPOSITORY          TAG           IMAGE ID       CREATED          SIZE
example-frontend    alpine        66faf4d26cc6   23 seconds ago   408MB
```

## 3.6: Multi-stage frontend

[Dockerfile](Dockerfile-3-6-frontend)

Frontend size reduces down to 120MB

```bash
docker image ls
REPOSITORY         TAG           IMAGE ID       CREATED          SIZE
example-frontend   latest        4382fd1a7423   47 seconds ago   120MB
```

Building and running with

```bash
docker build . -t example-frontend && docker run -p 5000:5000 example-frontend
```

...seems to work as expected, frontend can be opened at http://localhost:5000/.

## 3.6 (...or 3.7?): Multi-stage backend

[Dockerfile](Dockerfile-3-6-backend)

Frontend size reduces down to 18MB

```bash
docker image ls
REPOSITORY         TAG           IMAGE ID       CREATED          SIZE
example-backend    latest        ce18b77faf3f   44 seconds ago   18MB
```

Building and running with

```bash
docker build . -t example-backend && docker run -p 8080:8080 example-backend
```

...seems to work as expected, http://localhost:8080/ping answers with "pong".

## 3.7 (...or 3.8?):

[Original Dockerfile](Dockerfile-3-7-original)

[Updated Dockerfile](Dockerfile-3-7-new)

I chose Dockerfile of our old project, that can be found from here: https://github.com/nikomn/Kierratysavustin

The original image is quite large

```bash
docker image ls
REPOSITORY                TAG           IMAGE ID       CREATED                  SIZE
kierratysavustin-local   latest        14088b734577   Less than a second ago   1.22GB
```

To reduce the size I used a multi build strategy. I did not worry so much about
the build image size as I understood what matters is the image that is run, so
I kept most of the file as it is for the build part. It could also be trimmed
down by combining the RUN commands etc.

But what I did change was to use the alpine version of node for the final image.
I just copied the files from the build image to the final, and this could be
trimmed a bit more as now the backend tests etc. were copied to the final image
also. How ever as they are only txt files and not much size savings would happen.
I also changed the user to appuser for security.

The end image has quite a difference in size:

```bash
docker image ls
REPOSITORY                TAG           IMAGE ID       CREATED           SIZE
kierratysavustin-local   latest      321a7c723b01   54 seconds ago       182MB
```

So as the size changed that much, I think I am pretty happy with the end result :)

To run the program:

1. Clone the Kierratysavustin project
2. Make changes to Dockerfile or create a new one with name Dockerfile.edit for example
3. Add .env file to server folder (for example echo "somethingsecret" > server/.env)
4. Run docker build --build-arg PUBLIC_URL=/kierratysavustin -t kierratysavustin-local .
or docker build --build-arg PUBLIC_URL=/kierratysavustin -t kierratysavustin-local . -f Dockerfile.edit, if you chose to create an alternative dockerfile
5. Run docker-compose up -d (there is a docker-compose.yml file that handles the database etc.)
6. App should be running at http://localhost:3001/kierratysavustin
7. docker-compose down to close as usual
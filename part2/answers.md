# Part 2

## 2.1

[Docker-compose file](2-1-docker-compose.yml)

## 2.2

[Docker-compose file](2-2-docker-compose.yml)

## 2.3

[Docker-compose file](2-3-docker-compose.yml)

The file is meant to be in the folder that both the folder containing the backend and the folder containing backend are located.

## 2.4

[Docker-compose file](2-4-docker-compose.yml)

## 2.5

Scaling works and the test passes, when started with for example command:

```bash
docker-compose up --scale compute=5
```

## 2.6

[Docker-compose file](2-6-docker-compose.yml)

## 2.7

[Docker-compose file](2-7-docker-compose.yml)

## 2.8

[Docker-compose file](2-8-docker-compose.yml)

[nginx.conf file](nginx.conf)

## 2.9

[Docker-compose file](2-9-docker-compose.yml)

Note: The database files in ./database can only be viewed and deleted using sudo.

## 2.10

[Docker-compose file](2-10-docker-compose.yml)

[Backend Dockerfile](2-10-backend-Dockerfile)

[Frontend Dockerfile](2-10-frontend-Dockerfile)

### "If you had to do any changes explain what you had to change."

This as the few previous ones was a bit tricky, because the material does not
really give much clues and as I am not really familiar with proxys etc. I had
to basically just use trial and error. Googling around really just got me more
confused, so not sure if that helped or made things worse...

After I had gone through all the
imaginable variations for ENV REQUEST_ORIGIN= and REACT_APP_BACKEND_URL= I
noticed that the frontend always directed the buttons to localhost:8080/ping,
rather than localhost/api/ping.

I noticed that nothing I did made any difference and the app worked the same
even when I undid all that I had done on ex. 1.12 - 1.14 so I figured the
docker-compose was using some cached version and just ignored all my
changes on the Dockerfiles. So I deleted all containers and images and
tried again and as the build was done the frontend buttons pointed to
localhost/api/ping!

So what did I do? 

1. I changed the backend Dockerfile so that REQUEST_ORIGIN
is set as ENV REQUEST_ORIGIN=http://frontend:5000.
2. I removed the REACT_APP_BACKEND_URL from the frontend Dockerfile
3. I removed all the images and containers
4. I ran docker-compose up

And after this all buttons worked.

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
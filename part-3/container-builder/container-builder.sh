#!/bin/bash

read -p "Please define github repo adress: " repo

#echo $repo

repogit="${repo}.git"

#echo $repogit

git clone $repogit

imagename=${repo##*/} 

#echo $imagename

# cd */

cd $imagename

if [ -f Dockerfile ]
  then
    echo "Building Docker image..."
    docker build -t $imagename .
    read -p "Do you wish to publish the image to dockerhub? (y/n): " todockerhub
    if [[ "$todockerhub" == "y" ]]
      then
        echo "Log in to docker"
        docker login
        read -p "Define username/repository in dockerhub where to publish (remember to create one if needed): " dockerhubrepo
        docker tag $imagename $dockerhubrepo
        docker push $dockerhubrepo
    fi

  else
    echo "Error! Can not locate Dockerfile!"
fi
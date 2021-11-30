FROM ubuntu:18.04

WORKDIR /usr/src/app

COPY container-builder.sh .

CMD apt update ; apt install -y git ; ./container-builder.sh
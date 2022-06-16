#!/bin/bash

IMAGE_NAME="mottor1/alpine-git"
VERSION=$(cat VERSION.md | head -n 1)

docker login ## Enter login and pass

#--------------------------

docker build --tag "$IMAGE_NAME:latest" --tag "$IMAGE_NAME:$VERSION" .

for i in "$VERSION" "latest"; do
  printf "\n------\npushing '$IMAGE_NAME:$i'\n";
  docker push "$IMAGE_NAME:$i";
done

#--------------------------

docker build --build-arg INSTALL_ANSIBLE=1 --tag "$IMAGE_NAME:with-ansible-latest" --tag "$IMAGE_NAME:with-ansible-$VERSION" .

for i in "$VERSION" "latest"; do
  printf "\n------\npushing '$IMAGE_NAME:with-ansible-$i'\n";
  docker push "$IMAGE_NAME:with-ansible-$i";
done

echo " "
echo "[ DONE ]"
echo " "

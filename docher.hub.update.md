# How to update Docker Hub's version

    docker build -t mottor1/alpine-git .
    docker login ## Enter login and pass
    docker tag mottor1/alpine-git mottor1/alpine-git:1.0 ## change version here
    docker tag mottor1/alpine-git mottor1/alpine-git:latest
    docker push mottor1/alpine-git 

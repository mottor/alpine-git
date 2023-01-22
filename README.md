# alpine-git

Alpine Linux, включающий:

- bash
- git
- openssl, openssh-client
- curl
- vim
- rsync
- python3, pip
- jq, [yq](https://github.com/mikefarah/yq)
- [j2](https://github.com/kolypto/j2cli) (шаблонизатор jinja)

Ссылка [Docker Hub Link](https://hub.docker.com/r/mottor1/alpine-git)

Command to use:

    docker pull mottor1/alpine-git

Ранее здесь [была поддержка ansible](https://github.com/mottor/alpine-git/commit/ee9011f6bacf115ed062e58069d28aeb256bba38#diff-dd2c0eb6ea5cfc6c4bd4eac30934e2d5746747af48fef6da689e85b752f39557), но потом решил её убрать. Если нужно будет - сделаем отдельный image, который будет базироваться на этом образе.

---

Forked from [covex-nn/docker-alpine-git](https://github.com/covex-nn/docker-alpine-git)

FROM alpine:latest

ARG INSTALL_ANSIBLE=0
ARG ANSIBLE_VERSION=5.9.0
ARG ANSIBLE_LINT_VERSION=6.3.0

# yq
# https://github.com/mikefarah/yq

# Jinja2 templating
# https://github.com/kolypto/j2cli

RUN apk update \
    && apk add --no-cache bash git openssh-client coreutils curl jq ca-certificates openssh-client openssl rsync sshpass py3-pip vim \
    && wget -q -O /usr/bin/yq $(wget -q -O - https://api.github.com/repos/mikefarah/yq/releases/latest | jq -r '.assets[] | select(.name == "yq_linux_amd64") | .browser_download_url') \
    && chmod +x /usr/bin/yq \
    && pip install j2cli j2cli[yaml] \
    && rm -rf /var/cache/apk/*

COPY files/ssh_config /etc/ssh/ssh_config

RUN chmod 644 /etc/ssh/ssh_config \
    && git config --global user.name "Mottor Apline Image" \
    && git config --global user.email "mottor-apline-image@lpmotor.ru"

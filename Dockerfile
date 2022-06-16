FROM alpine:latest

ARG INSTALL_ANSIBLE=0
ARG ANSIBLE_VERSION=5.9.0
ARG ANSIBLE_LINT_VERSION=6.3.0

RUN apk update \
    && apk add --no-cache bash git openssh-client coreutils curl jq ca-certificates openssh-client openssl rsync sshpass

RUN if [ ${INSTALL_ANSIBLE} = 1 ]; then \
    apk add --no-cache python3 py3-pip py3-cryptography \
    && apk --update add --virtual .build-deps python3-dev libffi-dev openssl-dev build-base \
    && pip3 install --upgrade pip cffi \
    && pip3 install ansible==${ANSIBLE_VERSION} ansible-lint==${ANSIBLE_LINT_VERSION} \
    && apk del .build-deps \
    && mkdir -p /etc/ansible \
    && echo "localhost" > /etc/ansible/hosts \
    && ansible --version \
    && ansible-playbook --version \
;fi

# clear cache
RUN rm -rf /var/cache/apk/*

COPY files/ssh_config /etc/ssh/ssh_config

RUN chmod 644 /etc/ssh/ssh_config \
    && git config --global user.name "John Doe" \
    && git config --global user.email "doe@example.com"

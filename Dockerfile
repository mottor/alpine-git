FROM alpine:latest

RUN apk add --no-cache bash git openssh-client coreutils curl jq

COPY ./ssh_config /etc/ssh/ssh_config

RUN chmod 644 /etc/ssh/ssh_config \
    && git config --global user.name "John Doe" \
    && git config --global user.email "doe@example.com"

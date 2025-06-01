ARG VERSION=latest
FROM debian:${VERSION}

RUN apt-get update && apt-get install -y git stow wget curl zsh vim

WORKDIR /root

CMD ["bash"]


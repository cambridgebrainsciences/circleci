FROM docker:18.05.0-ce-git

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk add --no-cache \
  bash \
  ca-certificates \
  jq \
  micro \
  py-pip \
  \
  && \
  \
  pip install \
  docker-compose \
  awscli

WORKDIR /home/root/cambridgebrainsciences/cbstrials

ENTRYPOINT ["bash"]

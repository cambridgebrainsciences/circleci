FROM docker:18.05.0-ce-git

RUN apk add --no-cache \
  bash \
  ca-certificates \
  jq \
  py-pip \
  && pip install \
  docker-compose \
  awscli

WORKDIR /home/root/cambridgebrainsciences/cbstrials

ENTRYPOINT ["bash"]

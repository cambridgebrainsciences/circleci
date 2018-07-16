FROM docker:18.05.0-ce-git

RUN apk add --no-cache \
  bash \
  jq \
  py-pip \
  && pip install \
  docker-compose \
  awscli

WORKDIR /home/root/cambridgebrainsciences/cbstrials

ENTRYPOINT ["bash"]

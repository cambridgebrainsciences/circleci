FROM docker:19.03.13

RUN apk add --no-cache \
  bash \
  ca-certificates \
  git \
  jq \
  py-pip \
  \
  && pip install --upgrade pip \
  \
  && apk add --no-cache --virtual .docker-compose-deps python3-dev libffi-dev openssl-dev gcc libc-dev make \
  && CRYPTOGRAPHY_DONT_BUILD_RUST=1 pip install wheel docker-compose \
  && apk del .docker-compose-deps \
  \
  && echo 'alias aws="docker run --rm -e AWS_ACCESS_KEY_ID=\$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=\$AWS_SECRET_ACCESS_KEY -it amazon/aws-cli"' >> $HOME/.bashrc \
  && echo '. $HOME/.bashrc' >> /etc/profile \
  \
  && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
  && apk add --no-cache micro

WORKDIR /home/root/cambridgebrainsciences/cbstrials

ENTRYPOINT ["bash"]

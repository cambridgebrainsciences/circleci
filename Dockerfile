FROM docker:19.03.13

ENV BASH_ENV '/root/.bashrc'

COPY .bashrc /root/.bashrc

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
  && echo '. $HOME/.bashrc' >> /etc/profile \
  && echo '. $HOME/.bashrc' >> $HOME/.bash_profile \
  \
  && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
  && apk add --no-cache micro

WORKDIR /home/root/cambridgebrainsciences/cbstrials

ENTRYPOINT ["bash"]

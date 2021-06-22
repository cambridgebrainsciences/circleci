#!/bin/bash -x

shopt -s expand_aliases

[[ ! "$(docker images --filter reference="amazon/aws-cli" --quiet)" ]] && docker pull amazon/aws-cli

alias aws="docker run --rm -e AWS_ACCESS_KEY_ID=\$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=\$AWS_SECRET_ACCESS_KEY -it amazon/aws-cli"

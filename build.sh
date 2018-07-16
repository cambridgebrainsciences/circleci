#!/bin/bash

CIRCLE_CI_IMAGE_TAG=2.0.0

# https://github.com/cambridgebrainsciences/circleci

git tag -a "$CIRCLE_CI_IMAGE_TAG" -m "$CIRCLE_CI_IMAGE_TAG automatic deployment tag"

git push origin "$CIRCLE_CI_IMAGE_TAG"

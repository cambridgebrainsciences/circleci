#!/bin/bash -x

CIRCLE_CI_IMAGE_TAG="${1:-2.0.2}"

# https://github.com/cambridgebrainsciences/circleci

# delete previous local tag
if git tag --list | grep -qE "^${CIRCLE_CI_IMAGE_TAG}$"; then
  git tag -d "$CIRCLE_CI_IMAGE_TAG"
fi

git tag -a "$CIRCLE_CI_IMAGE_TAG" -m "$CIRCLE_CI_IMAGE_TAG automatic deployment tag"

git push origin --force "$CIRCLE_CI_IMAGE_TAG"

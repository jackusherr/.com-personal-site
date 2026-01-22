#!/bin/bash

cd ../.. || exit 1

# build site
hugo || exit 1

# stop if nothing changed
if git diff --quiet && git diff --cached --quiet; then
  echo "No changes to publish."
  exit 0
fi

# optional commit message
if [ -z "$1" ]; then
  msg="publish"
else
  msg="$1"
fi

git add .
git commit -m "$msg"
git push

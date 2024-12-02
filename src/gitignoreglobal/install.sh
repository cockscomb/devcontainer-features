#!/bin/sh
set -e

GITIGNORE_PATH="$(git config --system --get core.excludesfile || true)"
if [ -z "${GITIGNORE_PATH}" ]; then
  GITIGNORE_PATH=/etc/gitignore
  git config --system --add core.excludesfile $GITIGNORE_PATH
fi
echo "Using global gitignore file: ${GITIGNORE_PATH}"

mkdir -p "$(dirname "${GITIGNORE_PATH}")"
curl -sS "https://raw.githubusercontent.com/github/gitignore/main/${GITIGNORE}.gitignore" > "${GITIGNORE_PATH}"

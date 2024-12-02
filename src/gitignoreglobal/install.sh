#!/bin/sh
set -e

GITIGNORE_PATH="$(git config --global --get core.excludesfile || true)"
if [ -z "${GITIGNORE_PATH}" ]; then
  if [ -n "${XDG_CONFIG_HOME}" ]; then
    GITIGNORE_PATH="${XDG_CONFIG_HOME}/git/ignore"
  else
    GITIGNORE_PATH="${HOME}/.config/git/ignore"
  fi
fi
echo "Using global gitignore file: ${GITIGNORE_PATH}"

mkdir -p "$(dirname "${GITIGNORE_PATH}")"
curl -sS "https://raw.githubusercontent.com/github/gitignore/main/${GITIGNORE}.gitignore" > "${GITIGNORE_PATH}"

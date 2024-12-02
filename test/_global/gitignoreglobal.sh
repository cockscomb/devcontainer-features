#!/bin/bash

set -e

source dev-container-features-test-lib

# check <LABEL> <cmd> [args...]
mkdir -p /tmp/test_1
cd /tmp/test_1
git init

check "no difference at start" [ -z "$(git status --porcelain)" ]

touch .DS_Store
check "no difference after adding .DS_Store" [ -z "$(git status --porcelain)" ]

touch NOT_IGNORED
check "difference after adding NOT_IGNORED" [ -n "$(git status --porcelain)" ]

reportResults

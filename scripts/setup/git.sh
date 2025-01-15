#!/bin/bash

GIT_USERNAME="osmarmora05"
GIT_EMAIL="osmaradrianmoracerna@gmail.com"
EDITOR="codium --wait"
DEFAULT_BRANCH="main"

if [ "$(id -u)" = 0 ]; then
    echo "This script SHOULD NOT BE RUN AS ROOT"
    exit 1
fi

if  [ ! "$(command -v git)" ]; then
    echo "You dont' have git installed"
    exit 1
fi

echo "Git: "
echo "- Git user: $GIT_USERNAME $GIT_EMAIL"
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"

echo "- Core.editor: $EDITOR"
git config --global core.editor "$EDITOR"

echo "- init.defaultBranch: $DEFAULT_BRANCH"
git config --global init.defaultBranch $DEFAULT_BRANCH

echo "Completed git.sh"
echo ""
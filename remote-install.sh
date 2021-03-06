#!/usr/bin/env bash

[[ -x `command -v wget` ]] && CMD="wget --no-check-certificate -O -"
[[ -x `command -v curl` ]] >/dev/null 2>&1 && CMD="curl -#L"

REPO="https://github.com/chrisfraser/gwa-dotfiles"

if [ -z "$CMD" ]; then
    echo "No curl or wget available. Aborting."
else
    echo "Installing dotfiles"
    mkdir -p "$HOME/.dotfiles" && \
    eval "$CMD $REPO/tarball/master | tar -xzv -C ~/.dotfiles --strip-components=1 --exclude='{.gitignore}'"
    cd "$HOME/.dotfiles/"
    . install.sh
fi
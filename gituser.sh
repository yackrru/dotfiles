#!/usr/bin/env bash

# TODO(1): set disable false if use environment variables gitconfig
readonly disable=true
if "${disable}"; then
    return 0;
fi

# TODO(2): set name and EMAIL
name=""
export GIT_AUTHOR_NAME=$name
export GIT_COMMITTER_NAME=$name
export EMAIL=""

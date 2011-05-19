#!/bin/bash

if [ -z "$1" ]; then
  for command in "$(ls | egrep "\.jsfl$")"; do
    cp "$command" "$HOME/Library/Application Support/Adobe/Flash CS4/en/Configuration/Commands/"
  done
else
  cp "$1" "$HOME/Library/Application Support/Adobe/Flash CS4/en/Configuration/Commands/"
fi

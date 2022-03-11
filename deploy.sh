#!/bin/bash
# Deploys the blog to the directory in the second argument using the base url
# given in the first argument
mv config.toml .hidden
REPLACE=$(printf '%s\n' "$1" | sed -e 's/[\/&]/\\&/g')
# Replace the baseurl by the first argument to the command.
sed s/baseurl\ =\ \".*\"/baseurl\ =\ \"$REPLACE\"/ .hidden >> config.toml
hugo -d $2
mv .hidden config.toml

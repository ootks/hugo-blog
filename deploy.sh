#!/bin/bash
# Deploys the blog to the directory in the second argument using the base url
# given in the first argument
mv config.toml .hidden
REPLACE=$(printf '%s\n' "$1" | sed -e 's/[\/&]/\\&/g')
sed s/baseurl\ =\ \".*\"/baseurl\ =\ \"$REPLACE\"/ .hidden >> config.toml
hugo -D -d $2
mv .hidden config.toml

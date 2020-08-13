#!/bin/bash
# Deploys the blog to the directory in the second argument using the base url
# given in the first argument
mv config.toml .hidden
sed s/baseurl\ =\ \".*\"/baseurl\ =\ \"$1\"/ .hidden >> config.toml
hugo -D -d $2
mv .hidden config.toml

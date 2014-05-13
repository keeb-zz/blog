#!/usr/bin/env

cd /content
jekyll build
cp -r _site/* /www

#!/usr/bin/env

cd /md
jekyll build
cp -r _site/* /www

#!/bin/bash
set -x

bundle exec jekyll build
scp -rq _site/* lngo@cs.wcupa.edu:~/public_html/csc331/
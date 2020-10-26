#!/bin/bash
set -x

bundle exec jekyll build
scp -rq _site/* lngo@cs.wcupa.edu:~/public_html/csc331/
ssh lngo@cs.wcupa.edu "bash /home/lngo/keys/keys.sh /home/lngo/public_html/csc331/"
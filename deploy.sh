#!/bin/bash -eu
cd $OUTPUT_DIR
git init
git add .
git commit -m "Publishing site on `date "+%Y-%m-%d %H:%M:%S"`"
git push -f git@github.com:okwrtdsh/travisLatexSlack.git master:gh-pages


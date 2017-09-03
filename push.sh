#!/bin/sh

git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"
git add --force build/ccxt.es5.js
git add --force build/ccxt.browser.js
git add --force build/ccxt.php
git add --force ccxt/version.py
git add --force ccxt/exchanges.py
git add --force ccxt/async/exchanges.py
git tag -a '${COMMIT_MESSAGE}' -m '[ci skip]'
git commit -a -m '${COMMIT_MESSAGE} [ci skip]'
git remote remove origin
git remote add origin https://${GITHUB_TOKEN}@github.com/kroitor/ccxt.git
git push origin --tags HEAD:master
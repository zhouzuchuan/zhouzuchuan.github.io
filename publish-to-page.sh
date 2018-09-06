#!/bin/bash

set -ev

git clone https://${GH_REF} .deploy_git

cd .deploy_git
git checkout master

cd ../
mv .deploy_git/.git/ ./public/
cd ./public

git config user.name  "your name"
git config user.email "your email"
# add commit timestamp

git add .
git commit -m "Travis CI Auto Builder at `date +"%Y-%m-%d %H:%M"`"

git push --force --quiet "https://${TravisCIToken}@${GH_REF}" master:master
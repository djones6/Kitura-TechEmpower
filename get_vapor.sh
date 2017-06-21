#!/bin/bash
#
# Clone the Swift frameworks from the TechEmpower FrameworkBenchmarks project
#

if [ ! -d "FrameworkBenchmarks/frameworks/Swift" ]; then
  mkdir -p FrameworkBenchmarks
  cd FrameworkBenchmarks
  git init
  git remote add -f origin https://github.com/TechEmpower/FrameworkBenchmarks
  git config core.sparsecheckout true
  echo frameworks/Swift >> .git/info/sparse-checkout
  git pull origin master
  cd -
fi

if [ ! -e "vapor" ]; then
  ln -s FrameworkBenchmarks/frameworks/Swift/vapor vapor
fi

# Dependencies for Vapor
# sudo apt-get install libmysqlclient-dev

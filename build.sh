#!/bin/bash -e

if ! type fastlane > /dev/null 2>&1; then
  if type brew > /dev/null 2>&1; then
    brew install fastlane
  else
    sudo gem install fastlane -NV
  fi
fi

script_path=$(cd $(dirname ${0}); pwd)

if [ ! -d "./fastlane" ] 
then
    echo "fastlane dir does not exist, copying default config"
    cp -r ${script_path}/fastlane ./
fi
fastlane export_ipa

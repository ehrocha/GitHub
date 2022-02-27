#!/bin/sh
#-----------------------------------------------------------------
# Shell Script to make a GitHub Repository public
# Author : Eduardo Rocha - ehrocha@gmail.com
#-----------------------------------------------------------------
# https://docs.github.com/en/rest/reference/repos#update-a-repository
#-----------------------------------------------------------------
# Variable Initialization
# Package jq is required for parsing the JSON file
#-----------------------------------------------------------------
#set -x;
urepo=$1;
uname=($(jq -r '.uname' config.json));
utoken=($(jq -r '.utoken' config.json));
#-----------------------------------------------------------------
# Requesting Repository update from the API
# and clone the repository locally
#-----------------------------------------------------------------
echo "Making repository ${urepo} public for user ${uname}";
set -x;
curl -X PATCH \
     -H "Authorization: token ${utoken}" \
     -H "Accept: application/vnd.github.v3+json" \
     -d '{"name":"'${urepo}'","private":"false"}' \
     "https://api.github.com/repos/${uname}/${urepo}"
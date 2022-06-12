#!/bin/sh
#-----------------------------------------------------------------
# Shell Script to create a new GitHub Repository
# Author : Eduardo Rocha - ehrocha@gmail.com
#-----------------------------------------------------------------
# https://docs.github.com/en/rest/reference/repos#create-an-organization-repository
#-----------------------------------------------------------------
# Variable Initialization
# Package jq is required for parsing the JSON file
#-----------------------------------------------------------------
#set -x;
urepo=$1;
uname=$(jq -r '.uname' ~/.github/config.json);
utoken=$(jq -r '.utoken' ~/.github/config.json);
upriv=$(jq -r '.upriv' ~/.github/config.json);
#-----------------------------------------------------------------
# Requesting Repository Creation from the API
# and clone the repository locally
#-----------------------------------------------------------------
echo "Creating a new repository named ${urepo} for user ${uname}";
curl -H "Authorization: token ${utoken}" \
     -d '{"name":"'${urepo}'","private":"'${upriv}'"}' \
     "https://api.github.com/user/repos" \
     | grep -e 'ssh_url*' \
     | cut -d \" -f 4 \
     | xargs -L1 git clone ;
cd ${urepo};
git checkout -b dev;
echo "##Welcome to ${urepo}" > README.md;
git add *;
git commit -a -m "Initial Version";
git checkout -b master;
git merge;
git branch --unset-upstream;
git push --set-upstream origin master;
git push;
echo "Your new repository ${urepo} is ready";
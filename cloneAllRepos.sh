#!/bin/sh
#-----------------------------------------------------------------
# Shell Script to Clone all repositories from a user
# Author : Eduardo Rocha - ehrocha@gmail.com
#-----------------------------------------------------------------
# Variable Initialization
#-----------------------------------------------------------------
uname=$1;
utype="users";
upage=1 ; 
utoken=$(jq -r '.utoken' ~/.github/config.json);
echo "${utoken}";
#-----------------------------------------------------------------
# Requesting the list from the API and building the necessary Git
# Commands
#-----------------------------------------------------------------
curl "https://api.github.com/${utype}/${uname}/repos?page=${upage}&per_page=100" \
     -H "Authorization: token ${utoken}" \
     | grep -e 'git_url*' \
     | cut -d \" -f 4 \
     | xargs -L1 git clone ;
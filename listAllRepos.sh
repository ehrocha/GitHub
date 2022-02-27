#!/bin/sh
#-----------------------------------------------------------------
# Shell Script to List all repositories from a user
# Author : Eduardo Rocha - ehrocha@gmail.com
#-----------------------------------------------------------------
# Variable Initialization
#-----------------------------------------------------------------
uname=$1;
utoken=($(jq -r '.utoken' config.json));
#-----------------------------------------------------------------
# Listing Repositories
#-----------------------------------------------------------------
echo "Listing Repositories for ${uname}";
curl -H "Authorization: token $utoken" \
     "https://api.github.com/user/repos";
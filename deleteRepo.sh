#!/bin/sh
#-----------------------------------------------------------------
# Shell Script to delete a GitHub Repository
# Author : Eduardo Rocha - ehrocha@gmail.com
#-----------------------------------------------------------------
# https://docs.github.com/rest/reference/repos#delete-a-repository
#-----------------------------------------------------------------
# Variable Initialization
# Package jq is required for parsing the JSON file
#-----------------------------------------------------------------
urepo=$1;
uname=($(jq -r '.uname' ~/.github/config.json));
utoken=($(jq -r '.utoken' ~/.github/config.json));
#-----------------------------------------------------------------
# Requesting Repository Deletion from the API
#-----------------------------------------------------------------
echo " Deleting repository named ${urepo} for user ${uname}";
curl -X DELETE \
     -H "Authorization: token ${utoken}" \
     -H "Accept: application/vnd.github.v3+json" \
      "https://api.github.com/repos/${uname}/${urepo}";
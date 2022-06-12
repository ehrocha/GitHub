#!/bin/sh
#-----------------------------------------------------------------
# Shell Script to setup the local Git Environment
# Author : Eduardo Rocha - ehrocha@gmail.com
#-----------------------------------------------------------------
# Variable Initialization
# Package jq is required for parsing the JSON file
#-----------------------------------------------------------------
ufname=$(jq -r '.ufname' ~/.github/config.json);
umail=$(jq -r '.umail' ~/.github/config.json);
#-----------------------------------------------------------------
# Setting Up UserName and Email
#-----------------------------------------------------------------
git config --global user.name "${ufname}";
git config --global user.email "${umail}";
#-----------------------------------------------------------------
# Confirm the changes
#-----------------------------------------------------------------
git config --global user.name
git config --global user.email
git config --list
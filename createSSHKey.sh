#!/bin/sh
#-----------------------------------------------------------------
# Shell Script to setup the SSH Keys
# Author : Eduardo Rocha - ehrocha@gmail.com
#-----------------------------------------------------------------
# Variable Initialization
# Package jq is required for parsing the JSON file
#-----------------------------------------------------------------
rm -Rf ~/.ssh;
utoken=$(jq -r '.utoken' ~/.github/config.json);
umail=$(jq -r '.umail' ~/.github/config.json);
uhost=$(hostname);
ufile="/home/${USER}/.ssh/id_ed25519";
utitle="SSH Keys for ${uhost}";
if [ ! -f "${ufile}" ]; then
  ssh-keygen -t ed25519 -N "" -C "${umail}" -f "${ufile}"
fi
eval "$(ssh-agent -s)";
ssh-add "/home/${USER}/.ssh/id_ed25519";
ukey=$(cat /home/${USER}/.ssh/id_ed25519.pub);
#-----------------------------------------------------------------
# Store the newly created key into Github 
#-----------------------------------------------------------------
set -x;
curl -X POST \
     -H "Accept: application/vnd.github.v3+json" \
     -H "Authorization: token ${utoken}" \
     -H 'Content-Type: application/json' \
     --url https://api.github.com/user/keys \
     -d '{"key":"'"${ukey}"'","title":"'"${utitle}"'"}';
#-----------------------------------------------------------------
# Test SSH Communication
#-----------------------------------------------------------------
echo "yes\r" | ssh -o StrictHostKeyChecking=no -T git@github.com;
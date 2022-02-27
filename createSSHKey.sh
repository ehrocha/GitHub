#/bin/sh
#-----------------------------------------------------------------
# Shell Script to setup the SSH Keys
# Author : Eduardo Rocha - ehrocha@gmail.com
#-----------------------------------------------------------------
# Variable Initialization
# Package jq is required for parsing the JSON file
#-----------------------------------------------------------------
utoken=($(jq -r '.utoken' config.json));
umail=($(jq -r '.umail' config.json));
uhost=$(hostname);
ufile="/home/${USER}/.ssh/id_ed25519";
utitle="SSH Keys for ${uhost}";
if [ ! -f "${ufile}" ]; then
  echo -en "\n \n" | ssh-keygen -t ed25519 -C "${umail}"
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
     -d '{"key":"'"${ukey}"'","title":"'"${utitle}"'"}' 
#curl -X POST -H "Accept: application/vnd.github.v3+json" -H "Authorization: token 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" -d '{"key":"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPPWiipzCOQKlM69UhRGnxUdUejpGXu3ereYXg2Vib00 ","title":"SSH Keys for R2-D2"}' https://api.github.com/user/keys
# -d '{"key":"'${ukey}'","title":"'${utitle}'"}' \
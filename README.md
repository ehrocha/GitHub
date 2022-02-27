# Github Scripts
## Here you will find scrips to interact with Github's API 

|Script|Purpose|
|---|---|
|cloneAllRepos.sh|Clone all public repositories from a specific GitHub user|
|createNewRepo.sh|Create a new repository in Github, the script will create a new repository, populate it with a standard README.md file and clone the repository to a local folder|
|createSSHKey.sh|Creates a new SSH Key for use with GitHub and upload it to GitHub|
|deleteRepo.sh|Deletes a repository from GitHub *It does Not Prompt*, so use with caution|
|listAllRepos.sh|Lists all repositories for a given user|
|makeRepoPublic.sh|Makes a given repository public|
|setGitEnv.sh|Sets up the local GitHub environment based on the information found on the config.json file|
|config.json|Stores the default configuration used by all the scripts above, this is the firs place to start|

## Usage
* Fill up the information on the config file
+uname is your GitHub userID
+ufname is your full name
+umail is your email
+utoken is your GitHub token, you have to generate it in Developer Settings
+upriv is your default for repository creation, select true for creating private by default or false to create public repositories by default

After you have updated the config file you are ready to use the scripts.

### cloneAllRepos.sh 
- Will clone all the public user repositories
./cloneAllRepos.sh \<gitUser\> 

### createNewRepo.sh - Will create a new, empty repository, it will create a standard README.md file and clone to local.
./createNewRepo.sh \<RepoName\>

### createSSHKey.sh - Will create local SSH keys and will upload the public key to GitHub
./createSSHKey.sh

### deleteRepo.sh - Will delete a given repository, *no promprs*, use with caution
./deleteRepo.sh \<RepoName\>

### listAllRepos.sh - Will list all the public repositories for a given user
./listAllRepos.sh \<gitUser\>

### makeRepoPublic.sh - Will make a given repository public
./makeRepoPublic.sh \<RepoName\>

### setGitEnv.sh - Will setup the basic global settings for you based on the config.json file
./setGitEnv.sh

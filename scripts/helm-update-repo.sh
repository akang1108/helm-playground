#!/bin/bash

function press_any_key_to_continue {
  echo -e "\n$1"
  read -n 1 -s -r -p ""
}

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROJECT_ROOT_DIR="${SCRIPTS_DIR}/.."
HELM_REPO_DIR="${PROJECT_ROOT_DIR}/repo"
HELM_CHARTS_DIR="${PROJECT_ROOT_DIR}/charts"

##############################################################################################################
press_any_key_to_continue "Press any key to package all charts and add to repo locally"
cd $HELM_CHARTS_DIR
declare -a dirs
i=1
for d in */
do
  dirs[i++]="${d%/}"
done

cd $PROJECT_ROOT_DIR
for((i=1;i<=${#dirs[@]};i++))
do
  echo "Packaging charts/${dirs[i]}"
  helm package charts/${dirs[i]} -d repo/
done
helm repo index repo/

##############################################################################################################
press_any_key_to_continue "Press any key to push to origin"
cd $PROJECT_ROOT_DIR
git add .
git commit -am 'Update Helm charts and Helm repo'
git push -u origin main


##############################################################################################################
press_any_key_to_continue "Press any key to update local Helm repo from Github Helm repo"
helm repo update






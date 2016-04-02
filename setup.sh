#!/bin/bash

# Begin installing Stack.

## Get the FP Complete key.
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 575159689BEFB442

## Add the Ubuntu 14.04 (amd64) source repository.
echo 'deb http://download.fpcomplete.com/ubuntu trusty main'|sudo tee /etc/apt/sources.list.d/fpco.list

## Update apt-get repositories and install Stack.
sudo apt-get update && sudo apt-get install stack -y

# Echo newline.
echo ""

# Create Stack project directory.

## Prompt project name selection.
read -p "Project name: " projectname

## Create Stack directory from template "new-template".
stack new $projectname new-template

## Edit generated .cabal file.
vim ./$projectname/$projectname.cabal

## Run Stack's setup command in the project directory.
cd $projectname; stack setup; cd ../

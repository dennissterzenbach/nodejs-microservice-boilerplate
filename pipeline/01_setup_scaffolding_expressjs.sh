#!/bin/bash

set -e

basefoldername=".expressjs-scaffold-base"

min_length=5
if [[ "${#1}" -lt $min_length ]];
then
	echo "Usage: $0 <name_of_folder>"
	echo ""
	echo "name_of_folder is mandatory and is used to put the boilerplate code"
	echo "               to the right folder. minimal length is 5 characters."
	exit 1
fi

if [[ -d $basefoldername ]];
then
	echo "base folder exists. not re-installing the boilerplate package."
else
	mkdir $basefoldername
	cd $basefoldername
	npm install expressjs-microservice
	cd ..
fi

echo "creating '$1' folder and putting boilerplate copy into..."
mkdir $1
cd $1
cp -vR ../$basefoldername/node_modules/expressjs-microservice/* .

echo ""
echo "adding convenience files like .gitignore, .editorconfig"
cp ../pipeline/.gitignore ./.gitignore
cp ../pipeline/.editorconfig ./.editorconfig

echo ""
echo "running npm install to transform boilerplate to working setup"
npm install

echo ""
echo "for your convenience, these are the possible npm run options:"
npm run --list

echo ""
echo "done. you can now 'cd $1' and go."

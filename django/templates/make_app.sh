#!/bin/bash

function cp_settings() {
    app_name=$1
    mkdir "../${app_name}"
    cp Dockerfile Dockerfile.dev Makefile requirements.txt .make_env "../${app_name}"
}

if [ $# -ne 1 ]; then
    echo "Please provide exactly one argument."
    exit 1
fi

app_name="$1"  # 引数からアプリケーション名を取得

if [ ! -d "../${app_name}" ]; then
    cp_settings ${app_name}
else
    read -p "Directory is already exist. Do you want to remove and recreate it? [Y/n] " yn
    case $yn in
        [Yy]* ) rm -r "../${app_name}"; cp_settings ${app_name};;
        * ) echo "No changes made.";;
    esac
fi

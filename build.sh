#!/bin/bash
set -e
CURRENT_DIR=`dirname $0`
cd $CURRENT_DIR
mkdir -p ./files/usr/lib/vm_manager/

if [[ ! -d "./files/usr/lib/vm_manager/vm_manager_vue" ]]; then
  git clone https://github.com/fanjunwei/vm_manager_vue.git ./files/usr/lib/vm_manager/vm_manager_vue
else
  cd ./files/usr/lib/vm_manager/vm_manager_vue
  git pull
  cd $CURRENT_DIR
fi
if [[ ! -d "./files/usr/lib/vm_manager/vm_manager_django" ]]; then
  git clone https://github.com/fanjunwei/vm_manager_django.git ./files/usr/lib/vm_manager/vm_manager_django
else
  cd ./files/usr/lib/vm_manager/vm_manager_django
  git pull
  cd $CURRENT_DIR
fi
docker build -t fanjunwei/libvirt .


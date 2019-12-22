#!/bin/bash
set -e
mkdir -p ./files/usr/lib/vm_manager/
if [[ ! -d "./files/usr/lib/vm_manager/vm_manager_vue" ]]; then
  git clone https://github.com/fanjunwei/vm_manager_vue.git ./files/usr/lib/vm_manager/vm_manager_vue
fi
if [[ ! -d "./files/usr/lib/vm_manager/vm_manager_django" ]]; then
  git clone https://github.com/fanjunwei/vm_manager_django.git ./files/usr/lib/vm_manager/vm_manager_django
fi
docker build -t fanjunwei/libvirt .


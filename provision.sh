#!/bin/bash
apt-get update;
apt-get install -y git python python-pip python-dev libffi-dev libssl-dev;
pip install --upgrade pip virtualenv
mkdir -p /opt/dev /opt/env;
git clone --depth 1 https://github.com/cyverse/clank.git /opt/dev/clank;
virtualenv /opt/env/clank;
. /opt/env/clank/bin/activate;
pip install -r /opt/dev/clank/requirements.txt;
ansible-playbook /opt/dev/clank/playbooks/deploy_stack.yml -e @/vagrant/variables.yml;

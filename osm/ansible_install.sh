#!/bin/bash

if ! command -v ansible >/dev/null; then
        echo "Installing Ansible dependencies and Git."
        if command -v yum >/dev/null; then
                sudo yum install -y git python python-devel
        elif command -v apt-get >/dev/null; then
                sudo apt-get update -qq
                #sudo apt-get install -y -qq git python-yaml python-paramiko python-jinja2
                sudo apt-get install -y -qq git python python-dev
        else
                echo "neither yum nor apt-get found!"
                exit 1
        fi
        echo "Installing pip via easy_install."
        #wget http://peak.telecommunity.com/dist/ez_setup.py
        #sudo python ez_setup.py && rm -f ez_setup.py
        #sudo easy_install pip
	export LC_ALL="en_US.UTF-8"
	export LC_CTYPE="en_US.UTF-8"
	sudo apt install python-pip
        # Make sure setuptools are installed crrectly.
        sudo pip install setuptools --no-use-wheel --upgrade
        echo "Installing required python modules."
        sudo pip install paramiko pyyaml jinja2 markupsafe
        sudo pip install ansible
        sudo pip install -r ../requirements.txt
fi

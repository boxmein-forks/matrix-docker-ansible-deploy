#!/bin/sh
set -e
if ! command -v ansible-playbook >/dev/null 2>/dev/null; then
	echo "please install ansible: pip install --user ansible"
	exit 1
fi
ansible-playbook --ask-vault-pass -i inventory/hosts setup.yml --tags=start


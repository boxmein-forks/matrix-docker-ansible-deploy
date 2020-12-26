#!/bin/sh
set -e
if ! command -v ansible-playbook >/dev/null 2>/dev/null; then
	echo "please install ansible: pip install --user ansible"
	exit 1
fi

if [[ ! -f ./.password ]]; then
	op read -o .password op://Private/Matrix.boxmein.net/ansible-vault
fi

if [[ ! -f ./.become-password ]]; then
	op read -o .become-password op://Private/Matrix.boxmein.net/become-pass
fi

just roles
echo "Running install-all. Change to setup-all to perform uninstallations as well"
just install-all --become-password-file ./.become-password --vault-password-file ./.password

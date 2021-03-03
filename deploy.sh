#!/bin/sh
set -e
if ! command -v ansible-playbook >/dev/null 2>/dev/null; then
	echo "please install ansible: pip install --user ansible"
	exit 1
fi

run_ansible_command() {
	ansible-playbook --ask-vault-pass -i inventory/hosts setup.yml --tags=${1}
}

verify_setup() {
	printf "\x1b[31;1mMaking sure setup tasks are done\x1b[0m"
	run_ansible_command setup-all
}

start() {
	printf "\x1b[32;1mStarting services\x1b[0m"
	run_ansible_command start
}

self_check() {
	printf "\x1b[32;1mSelf-checking\x1b[0m"
	run_ansible_command self-check
}

usage() {
    echo "./deploy.sh (self-check|start|verify-setup)"
}

case $1 in
	self-check) self_check ;;
	start) start ;;
	verify-setup) verify_setup ;;
	*) usage ;;
esac


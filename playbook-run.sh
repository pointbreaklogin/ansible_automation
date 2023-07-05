#!/bin/bash

playbook_dir="$(pwd)"

echo "Available Ansible Playbooks:"
echo ""
ls -1 "$playbook_dir"
echo ""

echo "Enter the name of the playbook you want to run:"
read -r playbook_name

playbook_path="$playbook_dir/$playbook_name"

if [ -f "$playbook_path" ]; 
then
    echo "Executing Ansible playbook: $playbook_name"
    ansible-playbook "$playbook_path" -i $playbook_dir/inventory/inventory.ini
else
    echo "Error: Playbook '$playbook_name' does not exist."
fi


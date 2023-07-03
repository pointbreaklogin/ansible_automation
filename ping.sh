#!/bin/bash
# This is a script to run the Ansible ping command
echo "lab number"
read -p "Are you sure you want to run the script? (y/n): " -r a

if [ "$a" = "y" ]; 
then
	for ((sec=2; sec>=1; sec--));
	do
		echo -ne "The script executes : $sec \r"
		sleep 1
	done

		ansible -i inventory.ini hosts -m ping 
		echo "................................................................."
		echo " "
		echo "Execution completed ...!"
		echo "  "
elif [ "$a" = "n" ]; 
then
    echo "Good luck, see you next time <3"
else
    echo "Invalid argument supplied!"
fi

#!/bin/bash

# run this script initially before ./ping.sh
#this script gather the public key information from a remote server. ie,Retrieve and add SSH fingerprint non-interactively

purple="\033[1;95m"

success="\033[1;32m"
#green
warning="\033[1;33m"
#yellow
error="\033[1;31m"
#red
nocolour="\033[00m"
#nocolour

echo -e  " $nocolour ________________________________________ $nocolour";
echo -e "$purple Lab number $nocolour ";
read -p " Are you sure you want to run the script? (y/n): " -r a

if [ "$a" = "y" ]; 
then
  for ((sec=2; sec>=1; sec--)); 
  do
    echo -ne " $warning The script executes: $sec \r $nocolour ";
    sleep 1
  done

  # Read the inventory file and extract host IP addresses
  while IFS= read -r line; 
  do
    if [[ "$line" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; 
    then
      ip_address="$line"
      ssh-keyscan -H "$ip_address" >> ~/.ssh/known_hosts
    fi
  done < inventory.ini

  ansible -i inventory.ini hosts -m ping

  echo -e " $nocolour ................................................................. $nocolour ";
  echo " "
  echo -e " $success Execution completed! $nocolour ";
  echo " "
elif [ "$a" = "n" ]; 
then
  echo -e " $warning Good luck, see you next time <3 $nocolour ";
else
  echo -e  " $warning Invalid argument supplied! $nocolour ";
fi


#!/bin/bash

######################
###  INITIALISATION ##
######################

if [ $# -ne 0 ]; then
  echo "No Parameter(s) expected !"
  exit 1
fi

echo "Script is going to :"
echo "  -> setup 1 Vm : \"VM1\""
echo "  -> VM1 will setup env for running WWW1 & WWW2"
echo "  -> So Docker & Docker-compose are going to be installed on the Vagrant VM"
echo "Let's Start ? (y / N)"

read answer
if [ "$answer" == "${answer#[Yy]}" ] ; then
  exit 1
fi

cd VM1
vagrant destroy -f
echo "Moved to \"VM1/\", destroy VM and now making \"vagrant up\""
vagrant up
if [ $? -eq 0 ] ; then
  echo "It seems to worked ! (Be aware because host forwarded port < 1024 need to be root)"
else
  echo "VM1 installation failed !"
fi

echo ""
echo "Moved to main directory... you can moved to VMs directories and then launch \"vagrant ssh\""
echo "Once into the vagrant VM, you could start docker services from prepared-scripts into ~/"

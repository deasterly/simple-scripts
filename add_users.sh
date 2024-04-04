#!/bin/bash

# Add multiple users from a list and set a default password 

for U in john paul george ringo ; do
	sudo useradd --comment $U --groups wheel  $U 
	echo redhat | sudo passwd --stdin $U
done


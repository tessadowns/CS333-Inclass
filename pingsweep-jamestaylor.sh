#!/bin/bash
# Ping sweep the Lab
PingSweep(){
	local pass=0
	local fail=0
	local total=0
	local base="onyxnode"

	for q in {1..200} 
	do
		curr="$base$q"
		ping -c 1 $curr &> /dev/null #output to dev/null to prevent line prints
		
		if [ $? -eq 0 ]; then
			ping -n 1 $curr >> ping.log
			printf "\nNode ${curr} is reachable"
			pass=$((pass + 1))
		else
			printf "\nNode ${curr} is unreachable"
			fail=$((fail + 1))
		fi
			total=$((total + 1))
	done

	printf "\n$pass IP's were successfully pinged out of $total IP's tested"
	printf "\n$fail IP's were unsuccessfully pinged out of $total IP's tested"
	printf "\nMore details can be found in the 'ping.log' file"

}
PingSweep



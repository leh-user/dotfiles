
#!/bin/bash

while true; do

	CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
	
	MEM=$(free -m | awk '/Mem:/ { print $3"M/"$2"M" }')

#				### FOR BATTARY STATUS ###
#
#	BAT_PCT="$(cat /sys/class/power_supply/BAT0/capacity)%"
#	
#	if [ "$(cat /sys/class/power_supply/AC/online)" = "1" ]; then
#		
#		BAT="[ BAT: ${BAT_PCT} AC ]"
#
#	else
#
#		BAT="[ BAT: ${BAT_PCT} ]"
#	fi
#
# --> add [ BAT: $BAT ] to xsetroot when you uncomment it 

	DATE=$(date +"%Y-%m-%d %H:%M:%S")

	xsetroot -name " [ CPU: $CPU ] [ RAM: $MEM ] [ $DATE ] "
	sleep 1

done

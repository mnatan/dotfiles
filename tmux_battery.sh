#!/bin/bash
echo -n "#[fg=red]| ";
if [ -n $( acpi -b ) ] ; then
	echo -n "#[fg=blue]NO BATTERY #[fg=red]| "
else
	echo -n "#[fg=blue]#( acpi -b | awk '{print $4}' | sed 's/,//' ) #[fg=red]| #[fg=blue]#( acpi -b | awk '{print $5}' | sed 's/,//' ) #[fg=red]| "
fi;
echo -n "#[fg=yellow]$(date "+%a %d %b")"
echo -n "#[fg=green]$(date "+ %H:%M") "


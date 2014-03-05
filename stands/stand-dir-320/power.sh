#!/bin/sh

menu()
{
	echo
	echo
	echo Menu:
	echo
	echo " 1) reset (power-on) DIR-320 just now"
	echo " 2) reset DIR-320 with 5 seconds"
	echo " 3) turn DIR-320 off"
	echo

	read A

	date

	case "$A" in
	  1)
		lreset dir-320
		;;
	  2)
		sleep 5
		lreset dir-320
		;;
	esac
}

trap '' INT

while true; do
	menu
done

#!/bin/sh

# session name
sn=stand-dir-320

# minicom
#
# shell-less, static minicom
#MINICOM="../../../bin/minicom"
# system-wide minicom
MINICOM="minicom"

touch ../banner.tmp
tmux -f tmux.conf new-session -s "$sn" -n help -d '../show_banner.sh ../banner.tmp'
tmux new-window -t "$sn:1" -n "power" '../power.sh'
tmux new-window -t "$sn:2" -n "uart" 'while true; do $MINICOM -w -C ../log/minicom.USB0.log USB0; sleep 1; done'
tmux new-window -t "$sn:3" -n "openocd" 'while true; do telnet localhost 4444; sleep 5; done'
tmux new-window -t "$sn:4" -n "tips" 'while true; do less ../tips.txt ; sleep 1; done'

tmux select-window -t "$sn:0"

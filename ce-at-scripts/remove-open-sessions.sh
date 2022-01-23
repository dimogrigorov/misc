#!/bin/sh
 
for i in `pgrep "gnome-terminal"`; do
    kill -15 $i
done

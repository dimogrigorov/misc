#!/bin/sh
 
export DISPLAY=":0"
export PATH="$PATH:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/pt/.node/bin/.:/home/pt/.local/bin:/home/pt/bin"
 
E2E="/home/pt/projects/expense-e2e-ta/"
START_PORT=5555
NODES=3
 
if ! pgrep -x "node" > /dev/null; then
    for (( i=1; i<=$NODES; i++)); do
        PORT=$(($START_PORT+$i))
        gnome-terminal -e "/home/pt/.node/bin/node $E2E/node_modules/selenium-standalone/bin/selenium-standalone start -- -role node -nodeConfig $E2E/nodeConfig.json -port $PORT" & &>/dev/null &
            disown
    done
fi

#!/bin/bash
# https://unix.stackexchange.com/questions/41346/upload-download-speed-in-tmux-status-line/41352#41352

iface="$(route | grep "default" | awk '{print $8}')"
if [ -n "$iface" ]; then
    RXB=$(</sys/class/net/"$iface"/statistics/rx_bytes)
    TXB=$(</sys/class/net/"$iface"/statistics/tx_bytes)
    sleep 2
    RXBN=$(</sys/class/net/"$iface"/statistics/rx_bytes)
    TXBN=$(</sys/class/net/"$iface"/statistics/tx_bytes)
    RXDIF=$(echo $((RXBN - RXB)) )
    TXDIF=$(echo $((TXBN - TXB)) )

    echo -e " ↓ $((RXDIF / 1024 / 2))K/s ↑ $((TXDIF / 1024 / 2))K/s"

else
    echo -e " No iface"
fi


#!/usr/bin/env zsh
bluetoothctl power on &&  bluetoothctl remove 7C:49:EB:70:C0:78
bluetoothctl discoverable on
bluetoothctl scan on
sleep 3
bluetoothctl trust 7C:49:EB:70:C0:78 && bluetoothctl pair 7C:49:EB:70:C0:78 && bluetoothctl connect 7C:49:EB:70:C0:78



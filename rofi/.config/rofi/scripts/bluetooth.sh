
echo -en "\0prompt\x1fBluetooth\n"
echo -en "\0keep-selection\x1fTrue\n"
echo -en "\0message\x1fConnected Devices: &#x0a;$(bluetoothctl devices Connected | grep Device | cut -c 25-100)\n"

if [ "$@" = "disconnect" ]
then
  coproc ( bluetoothctl disconnect )
  echo -en "\0message\x1fDevices Disconnected\n"
elif [ "$@" = "list" ]
then
  echo -en "\0message\x1fConnected Devices: &#x0a;$(bluetoothctl devices Connected | grep Device | cut -c 25-100)\n"
else
  coproc ( bluetoothctl connect '$@' )
fi


#echo -en "$(bluetoothctl devices | grep Device | cut -c 8-24)\0display\x1f$(bluetoothctl devices | grep Device | cut -c 26-100)\n"

echo -en "list\0display\x1fRelist devices\n"
echo -en "disconnect\0display\x1fDisconnect All\n"

battery_percentage=`acpi -b | grep -P -o '[0-9]+(?=%)'`
if [ $battery_percentage -le 10 ]
then
    ( speaker-test -t sine -f 1000 )& pid=$! ; sleep .9s ; kill -9 $pid
    notify-send "Battery low Alert" "Battery level is ${battery_percentage}%!"
    ( speaker-test -t sine -f 1000 )& pid=$! ; sleep .5s ; kill -9 $pid
fi

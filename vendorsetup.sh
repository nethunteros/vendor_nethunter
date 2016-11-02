for device in $(cat vendor/nethunter/nethunter.devices)
do
add_lunch_combo nethunter_$device-userdebug
done

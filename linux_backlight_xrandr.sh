#!/bin/bash
#This project comes from https://github.com/dabaisuv/linux_backlight_xrandr/

#Put this file in /etc/profile.d/ , and the script will run automatically in the background after logging in. 
#Then you can adjust the screen brightness in the system settings
#Or you just run it on the command line and adjust the screen brightness in the system settings at this time

#The following variable is backlight_dir can also be /sys/class/backlight/intel_backlight/ 
#or other contains files brightness and brightness_max folder. 
#However, the default is /sys/class/backlight/acpi_video0/ may work in most cases.It depends on your system.
{
echo "Running... Now you can change your backlight."
sleep 3
backlight_dir=/sys/class/backlight/acpi_video0/
current_file=brightness
max_file=max_brightness
xrandrlight_min=0.6
xrandrlight_max=1
brightness_current=$(cat $backlight_dir/$current_file)
brightness_max=$(cat $backlight_dir/$max_file)

brightness_percent=$(awk 'BEGIN{printf "%.6f",('$brightness_current'/'$brightness_max')*100}')
xrandrlight_point=$(awk 'BEGIN{printf "%.6f",(''('$xrandrlight_max'-'$xrandrlight_min')''/'100')}')
in_use=`xrandr | awk -F ' ' '{print $2}'`
in_use_=`echo $in_use | awk '{split($0,a," ");
for(i in a)
    if(a[i]=="connected") print i}'`
device=`xrandr | awk -F ' ' '{print $1}'`
array=(${device// / })
device_=${array[$in_use_-1]}


xrandrlight_real=$(awk 'BEGIN{printf "%.6f",('$xrandrlight_min'+'$xrandrlight_point'*'$brightness_percent')}')

m_i=0
while [ $m_i != 3 ]
do
    brightness_current=$(cat $backlight_dir/$current_file)
    brightness_percent=$(awk 'BEGIN{printf "%.6f",('$brightness_current'/'$brightness_max')*100}')
    xrandrlight_real=$(awk 'BEGIN{printf "%.6f",('$xrandrlight_min'+'$xrandrlight_point'*'$brightness_percent')}')
    xrandr --output $device_ --brightness $xrandrlight_real
    sleep 1
    let m_i++
done


while(true)
do
    if [ $brightness_current != $(cat $backlight_dir/$current_file) ]
    then
        brightness_current=$(cat $backlight_dir/$current_file)
        brightness_percent=$(awk 'BEGIN{printf "%.6f",('$brightness_current'/'$brightness_max')*100}')
        xrandrlight_real=$(awk 'BEGIN{printf "%.6f",('$xrandrlight_min'+'$xrandrlight_point'*'$brightness_percent')}')
        xrandr --output $device_ --brightness $xrandrlight_real
    fi

    sleep 0.01
done
}&


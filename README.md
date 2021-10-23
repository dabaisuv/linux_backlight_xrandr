# linux_backlight_xrandr
If your Linux can only use the xrandr command to adjust the screen brightness because of some drivers or other reasons, this tool will help you automatically use xrandr to adjust the screen brightness. All you need to do is adjust the system brightness normally


Method 1: Put this file in /etc/profile.d/ , and the script will run automatically in the background after logging in. Then you can adjust the screen brightness in the system settings

Method 2: Just run it on the command line and adjust the screen brightness in the system settings at this time

Tips: The Variable backlight_dir can also be /sys/class/backlight/intel_backlight/ or other contains files brightness and brightness_max folder. However, the default is /sys/class/backlight/acpi_video0/ may work in most cases.It depends on your system.

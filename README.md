# linux_backlight_xrandr
English:
If your Linux can only use the xrandr command to adjust the screen brightness because of some drivers or other reasons, this tool will help you automatically use xrandr to adjust the screen brightness. All you need to do is adjust the system brightness normally


Method 1: Put this file in /etc/profile.d/ , and the script will run automatically in the background after logging in. Then you can adjust the screen brightness in the system settings

Method 2: Just run it on the command line and adjust the screen brightness in the system settings at this time

Tips: The Variable backlight_dir can also be /sys/class/backlight/intel_backlight/ or other contains files brightness and brightness_max folder. However, the default is /sys/class/backlight/acpi_video0/ may work in most cases.It depends on your system.


Chinese:
如果你的Linux因为某些驱动或者其他原因只能使用xrandr命令来调节屏幕亮度，这个工具会帮你自动使用xrandr来调节屏幕亮度。 您需要做的就是正常调整系统亮度

方法一：将此文件放在 /etc/profile.d/ ，登录后脚本会在后台自动运行。 然后你可以在系统设置中调整屏幕亮度

方法二：直接在命令行运行，此时在系统设置中调整屏幕亮度即可

提示：变量backlight_dir 也可以是/sys/class/backlight/intel_backlight/ 或其他包含文件brightness 和brightness_max 的文件夹。 但是，默认为 /sys/class/backlight/acpi_video0/ 可能在大多数情况下有效。这取决于您的系统。

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Enable Natural Scrolling
xinput set-prop "SYNA2BA6:00 06CB:CF00 Touchpad" "libinput Natural Scrolling Enabled" 1

# Enable Tap-to-click
xinput set-prop "SYNA2BA6:00 06CB:CF00 Touchpad" "libinput Tapping Enabled" 1

# Tweak touchpad spped
xinput set-prop "SYNA2BA6:00 06CB:CF00 Touchpad" "libinput Accel Speed" .4

# Tweak touchpad scroll speed
xinput set-prop "SYNA2BA6:00 06CB:CF00 Touchpad" "libinput Scrolling Pixel Distance" 50 


# Enable two-finger right click
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'areas'

# Added by Toolbox App
export PATH="$PATH:/home/yiang/.local/share/JetBrains/Toolbox/scripts"

#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# -----------------------------------------------------
# Auto Start on .bash_profile
# -----------------------------------------------------

[[ ! $DISPLAY && $(tty) = "/dev/tty1" ]] && startx
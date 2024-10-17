#
# ~/.bash_profile
#
source ~/.bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
wmname LG3D
startx
fi

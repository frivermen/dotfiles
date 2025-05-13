#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# alias grep='grep --color=auto'
# Set RED prompt
# PS1="\[\e[01;31m\]$PS1\[\e[00m\]"
# Set Green prompt
PS1="\[\e[01;32m\]$PS1\[\e[00m\]"


color_prompt=yes
alias poweroff='loginctl poweroff'
alias reboot='loginctl reboot'
alias mount='udisksctl mount -b'
alias bs='cat ~/.bash_history | grep'
alias feh='feh -.Z $@'
alias 7z='7z -mx9 $@'
alias cp="/usr/local/bin/cpg -g"
alias mv="/usr/local/bin/mvg -g"

export HISTSIZE=9000
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r;"
export EDITOR=hx
export VISUAL=hx
export STM32_PRG_PATH=/home/frivermen/stm32/bin

n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        exit
    }
    [ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TRASH=1

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn -d "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}

lc() {
    if [ -z "$2" ]; then
        lua -e "print(string.format('%.2f', $1))"  # по умолчанию 2 знака
    else
        lua -e "print(string.format('%.${2}f', $1))"  # кастомный scale
    fi
}

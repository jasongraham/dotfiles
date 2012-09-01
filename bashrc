# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color)
        TERM=xterm-256color
        color_prompt=yes
        ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Code found online to truncate the displayed pathway
PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'

# Note: For some reason, \$ isn't automatically putting a '$' or '#' depending on user.
#       Performed manually below, and differentiating colors.
if [ $UID -eq 0 ] ; then
    PS1="\[\033[01;31m\]\h\[\033[01;34m\][\$CurDir]\[\033[01;31m\]#\[\033[00m\] "
else
    PS1="\[\033[01;32m\]\h\[\033[01;34m\][\$CurDir]\[\033[01;32m\]$\[\033[00m\] "
fi

# Bash Completion under sudo and man
complete -cf sudo
complete -cf man

# Alias definitions.

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# some more ls aliases
alias ll='ls -lh'
alias la='ls -a'
#alias l='ls -CF'
alias whoareyou='echo "I'\''m a freaking computer, dumbass."'
alias gh='ssh homeserver'
alias gw='ssh -XY newyoyo'
alias feedfetcher='feedfetcher https://archlinux.org/feeds/news'

# Include this bash functions file
# Color man pages
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Disable Pango in Firefox
export MOZ_DISABLE_PANGO=1

export EDITOR=vim

export PATH=$PATH:/home/grahjm2a/bin:/home/grahjm2a/.gem/ruby/1.9.1/bin

# Spit out reminders when I open a terminal, if there is a reminders file
if [ -f $HOME/.reminders ] && [ -x /usr/bin/remind ]; then
    /usr/bin/remind $HOME/.reminders
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

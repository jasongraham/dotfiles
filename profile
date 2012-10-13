if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

PATH="$HOME/bin:$PATH"

eval `dircolors -b ~/.dircolors`

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


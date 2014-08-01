#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\n\e[38;5;173m\](\[\e[38;5;15m\]\u@\h\[\e[38;5;173m\])-\[\e[38;5;173m\](\[\[\e[38;5;15m\]\w\[\e[38;5;173m\])\n\e[38;5;173m\](\[\e[38;5;15m\]jobs:\j\[\e[38;5;173m\])-(\[\e[38;5;15m\]!\!\[\e[38;5;173m\]):\[\e[0m\] "

# less colours
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;37m") \
		LESS_TERMCAP_md=$(printf "\e[1;37m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;47;30m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[0;36m") \
			man "$@"
}

#Custom

if [ -f ~/Dropbox/bash_aliases ]; then                                                 
    . ~/Dropbox/bash_aliases
fi

if [ -f ~/.bash_local ]; then                                                 
    . ~/.bash_local
fi

export EDITOR="vim"
export PATH=$PATH:~/bin
export HISTCONTROL=ignoredups
shopt -s cdspell
# exec zsh -d
export PATH=$PATH:~/.cabal/bin:~/.xmonad/bin

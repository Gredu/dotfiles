#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#function EXT_COLOR () { echo -ne "\[\033[38;5;$1m\]"; }

# set a fancy prompt
# export PS1="`EXT_COLOR 172`[\u@\h \W]\$${NO_COLOUR} "

#PS1='[\u@\h \W]\$ '
#PS1='\n[\W]\$ '
#PS1="\n\[\e[32;1m\](\[\e[37;1m\]\u\[\e[32;1m\])-(\[\e[37;1m\]\h\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]!\!\[\e[32;1m\])\n\[\e[32;1m\](\[\[\e[37;1m\]\w\[\e[32;1m\])-> \[\e[0m\]"
#PS1="\[\e[1;36m\]\w\[\e[1;31m\]:\[\e[0;37m\] "
#PS1="\n\e[32;1m\](\[\e[37;1m\]\u@\h\[\e[32;1m\])-\[\e[32;1m\](\[\[\e[37;1m\]\w\[\e[32;1m\])\n\e[32;1m\](\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]!\!\[\e[32;1m\]):\[\e[0m\] "
PS1="\n\e[38;5;173m\](\[\e[38;5;15m\]\u@\h\[\e[38;5;173m\])-\[\e[38;5;173m\](\[\[\e[38;5;15m\]\w\[\e[38;5;173m\])\n\e[38;5;173m\](\[\e[38;5;15m\]jobs:\j\[\e[38;5;173m\])-(\[\e[38;5;15m\]!\!\[\e[38;5;173m\]):\[\e[0m\] "
#PS1="\n`EXT_COLOR 172`(\[\e[37;1m\]\u@\h`EXT_COLOR 172`)-(\[\[\e[37;1m\]\W`EXT_COLOR 172`)\n`EXT_COLOR 172`(\[\e[37;1m\]jobs:\j`EXT_COLOR 172`)-(\[\e[37;1m\]!\!`EXT_COLOR 172`):\[\e[0m\] "


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

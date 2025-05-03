case "$(uname)" in
  Darwin)
    # macOS specific config
    source ~/.zshrc-macos
    ;;
  Linux)
    # Linux-specific config
    source ~/.zshrc-linux
    ;;
  *)
    echo "Unknown OS, no spesific configuration for: $(uname)"
    ;;
esac

source ${HOME}/.env

# Async for zsh, used by pure
zplug "mafredri/zsh-async", from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme

# oh-my-zsh
zplug 'plugins/git', from:oh-my-zsh
zplug 'plugins/github', from:oh-my-zsh
zplug 'plugins/extract', from:oh-my-zsh
zplug 'plugins/vi-mode', from:oh-my-zsh
zplug 'plugins/pass', from:oh-my-zsh
zplug 'plugins/colored-man-pages', from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh

# zsh-users
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug load

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install zplug plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Misc
alias o='ls -latr'
alias ns='nvim ~/notes/scratchpad.md'

# Keyboard
alias setkb='setxkbmap -option caps:escape -layout fiWithProgrammer -variant programmer'

alias ppminit='ppm docker down && ppm docker up && ppm dev docker init'

# Look weather
alias weather='curl wttr.in/'

# Dictionary
alias enfi='trans en:fi '
alias fien='trans fi:en '

# Subtitles
alias suben='subliminal download -s -l en '
alias subfi='subliminal download -s -l fi '

# Torrent
alias torrent='transmission-daemon; stig'

# Directory
alias cdd='cd ~/Downloads/'
alias cddt='cd ~/Downloads/transmission'
alias cdc='cd ~/Documents/'
alias cdr='cd ~/dotfiles/root/'
alias cdrc='cd ~/dotfiles/root/.config/'
alias cdp='cd ~/Projects/'
alias cdpl='cd ~/Projects/louhi/'
alias cdps='cd ~/Projects/saashop/'
alias cdpp='cd ~/Projects/personal/'

export EDITOR='nvim'

bindkey -M vicmd '/' history-incremental-search-backward
# bindkey '^j' vi-forward-word

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000

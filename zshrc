# Use zgen to handle all plugins
source "${HOME}/.zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  # plugins
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/github
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/vi-mode

  zgen load zsh-users/zsh-syntax-highlighting

  # completions
  # zgen load zsh-users/zsh-completions src

  # theme
  # Order matters
  zgen load mafredri/zsh-async
  zgen load sindresorhus/pure

  # autosuggestions should be loaded last
  # zgen load tarruda/zsh-autosuggestions

  # save all to init script
  zgen save
fi


# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="af-magic"

# Aliases
alias irs='ssh fitzz@vauhtis.thegroup.fi'
alias o='ls -latr'

# Start Eclim server
# alias eclim='/usr/share/eclipse/eclimd'
alias eclim='/opt/homebrew-cask/Caskroom/eclipse-ide/4.5.1/Eclipse.app/Contents/Eclipse/eclimd'

# Look weather
alias weather='curl wttr.in/'

# Dictionary
alias enfi='trans en:fi '
alias fien='trans fi:en '

# Subtitles
alias suben='subliminal download -s -l en '
alias subfi='subliminal download -s -l fi '

# Programming keyboard
# Sometimes reset to default?
alias setkb='setxkbmap -layout fi -variant programmer'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# source $ZSH/oh-my-zsh.sh

# User configuration

export GOPATH="${HOME}/Code/go"
export RUBYPATH="${HOME}/.gem/ruby/2.4.0"
export PATH="${RUBYPATH}/bin:${GOPATH}/bin:/usr/local/bin:$HOME/.bin:/usr/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"
# export PATH="$HOME/bin:/Users/gredu/Applications/homebrew/bin:~/.xmonad/bin:/usr/local/heroku/bin:/home/greatman/.cabal/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/bin:/usr/local/bin:/usr/sbin:/sbin:/bin:/usr/games:/usr/local/games"
# export PATH="$HOME/heroku-client/bin:$HOME/bin:$HOME/.rbenv/bin:/Users/gredu/Applications/homebrew/bin:~/.xmonad/bin:/usr/local/heroku/bin:/home/greatman/.rbenv/shims:/home/greatman/.cabal/bin:/home/greatman/.rbenv/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/bin:/usr/local/bin:/usr/sbin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

bindkey -M vicmd '/' history-incremental-search-backward
# bindkey '^j' vi-forward-word

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/home/greatman/.zshrc'

# autoload -Uz compinit
# compinit

# End of lines added by compinstall

# export TERM='tmux-256color'
# export JAVA_HOME=$(/usr/libexec/java_home)

# Ruby on Rails course
# eval "$(rbenv init -)"
# export APIKEY="7a700ad0762213f3a25a67de7a5de226"
# export GITHUB_KEY="2941e20cafd98da9daab"
# export GITHUB_SECRET="3469e6d6fcbe873e7b1921d19a9bf5287735ad4d"

# Ruby on Rail project for Kisällioppiminen
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

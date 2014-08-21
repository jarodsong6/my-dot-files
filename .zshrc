# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

source $ZSH/oh-my-zsh.sh
unsetopt correct

# Customize to your needs...
bindkey -e
bindkey '^U' backward-kill-line
bindkey "^[OC" forward-word
bindkey "^[OD" backward-word

vi_cv_path_python_plibs="-L/usr/lib/python2.5/config/"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH
export EDITOR='vim'

# source $HOME/.zsh/z.sh

alias tmux="TERM=screen-256color-bce tmux -u"

# fix zsh tab completion of git commands slow issue
__git_files () {
    _wanted files expl 'local files' _files
}

# vim <-> shell
setopt hist_ignore_space
bindkey -s '^z' '^[q %vi^m'

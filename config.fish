starship init fish | source

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx FZF_DEFAULT_COMMAND 'rg -uu --files --hidden --glob "!.git"'
set -gx JAVA_HOME (/usr/libexec/java_home -v "11")
set -gx USE_GKE_GCLOUD_AUTH_PLUGIN True
set -gx GOPATH $HOME/go
set -gx EDITOR nvim

set -e fish_user_paths
set -U fish_user_paths /opt/homebrew/bin /opt/homebrew/sbin /usr/local/sbin $HOME/.pyenv/shims $HOME/.local/bin $GOPATH/bin $JAVA_HOME/bin $fish_user_paths

alias k kubectl

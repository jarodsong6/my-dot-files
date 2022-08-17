starship init fish | source

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx FZF_DEFAULT_COMMAND 'rg -uu --files --hidden --glob "!.git"'
set -gx IBM_CLOUD_API_KEY udZuBDjKIn8xZHYjor08FvfNMxqge5XWb-G6mjLUFga3
set -gx GOPATH $HOME/go
set -gx JAVA_HOME (/usr/libexec/java_home -v "1.8")

set -e fish_user_paths
set -U fish_user_paths /usr/local/sbin $HOME/.pyenv/shims $HOME/.local/bin $GOPATH/bin $JAVA_HOME/bin $fish_user_paths

starship init fish | source

set PATH $HOME/.pyenv/shims $PATH
set -e fish_user_paths
set -U fish_user_paths /usr/local/sbin $fish_user_paths
set -U fish_user_paths /usr/local/bin/zctl $fish_user_paths

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x IBM_CLOUD_API_KEY udZuBDjKIn8xZHYjor08FvfNMxqge5XWb-G6mjLUFga3
set -U fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths

alias nokube="kubectl config unset current-context"

source ~/.iterm2_shell_integration.fish

set -g theme_color_scheme gruvbox

alias brew="arch -x86_64 brew"
alias vim="nvim"
alias tmux="tmux -2"
alias dcrm="docker-compose run --rm"
alias dwbe="docker-compose run --rm web bundle exec"
alias ggmaster="git branch --merged master | grep -v master | xargs git branch -d"
alias ggmain="git branch --merged main | grep -v main | xargs git branch -d"

source /usr/local/opt/asdf/asdf.fish

set -a PATH (npm bin)
set -a PATH (npm bin -g)
set -g fish_user_paths "/usr/local/opt/imagemagick@6/bin" $fish_user_paths

set -U ANDROID_SDK_ROOT {$HOME}/Library/Android/sdk
set -a PATH {$ANDROID_SDK_ROOT}/emulator
set -a PATH {$ANDROID_SDK_ROOT}/tools
set -a PATH {$ANDROID_SDK_ROOT}/tools/bin
set -a PATH {$ANDROID_SDK_ROOT}/platform-tools

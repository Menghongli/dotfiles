test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -g theme_color_scheme nord

# pyenv init
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
  pyenv virtualenv-init - | source
  set pyenv ~/.pyenv/shims/
  set -a PATH $pyenv
end

# nodenv init
if command -v nodenv 1>/dev/null 2>&1
  nodenv init - | source
end

status --is-interactive; and rbenv init - fish | source

set -a PATH ~/.local/bin
set -a PATH (npm bin)
set -a PATH (npm bin -g)
set -a PATH ~/.pingpong/bin
set -a PATH /Users/menghong/Library/Application\ Support/Coursier/bin

alias vim="nvim"
alias prv="poetry run nvim"
alias tmux="tmux -2"
alias cat="bat"
alias dcrm="docker-compose run --rm"
alias dwbe="docker-compose run --rm web bundle exec"
alias ggmaster="git branch --merged master | grep -v master | xargs git branch -d"
alias ggmain="git branch --merged main | grep -v main | xargs git branch -d"

if not set -q TMUX
  set -g TMUX tmux new-session -d -s base
  eval $TMUX
  tmux attach-session -d -t base
end

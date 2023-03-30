eval $(/opt/homebrew/bin/brew shellenv)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -g theme_color_scheme nord

# pyenv init
if command -v pyenv 1>/dev/null 2>&1
  set -Ux PYENV_ROOT $HOME/.pyenv
  fish_add_path $PYENV_ROOT/bin
  pyenv init - | source
end

# nodenv init
if command -v nodenv 1>/dev/null 2>&1
  nodenv init - | source
end

if command -v rbenv 1>/dev/null 2>&1
  status --is-interactive; and rbenv init - fish | source
end

set -a PATH ~/.local/bin

if command -v npm 1>/dev/null 2>&1
  set -a PATH (npm bin)
  set -a PATH (npm bin -g)
end

alias vim="nvim"
alias prv="poetry run nvim"
alias tmux="tmux -2"
alias cat="bat"
alias ggmaster="git branch --merged master | grep -v master | xargs git branch -d"
alias ggmain="git branch --merged main | grep -v main | xargs git branch -d"

if not set -q TMUX
  set -g TMUX tmux new-session -d -s base
  eval $TMUX
  tmux attach-session -d -t base
end

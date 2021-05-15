if test -d $HOME/.cargo/bin
  set -x PATH $PATH $HOME/.cargo/bin
end

if test -d $HOME/.pyenv/bin
  set -x PATH $HOME/.pyenv/bin $PATH
  status is-interactive; and source (pyenv init -|psub)
  status is-interactive; and source (pyenv virtualenv-init -|psub)
end

eval (starship init fish)

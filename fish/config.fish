if status is-interactive
and not set -q TMUX
  exec tmux
end

if test -d $HOME/.cargo/bin
  set -x PATH $PATH $HOME/.cargo/bin
end

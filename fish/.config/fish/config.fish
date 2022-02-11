if test -d $HOME/.cargo/bin
  set -x PATH $PATH $HOME/.cargo/bin
end

if test -d $HOME/.pyenv/bin
  set -x PATH $HOME/.pyenv/bin $PATH
  status is-interactive; and source (pyenv init -|psub)
  status is-interactive; and source (pyenv virtualenv-init -|psub)
end

if test -d $HOME/.google-cloud-sdk/bin
  set -x PATH $PATH $HOME/.google-cloud-sdk/bin
end

if test -f /home/nafarlee/.cache/yay/google-cloud-sdk/pkg/google-cloud-sdk/opt/google-cloud-sdk/path.fish.inc
  source /home/nafarlee/.cache/yay/google-cloud-sdk/pkg/google-cloud-sdk/opt/google-cloud-sdk/path.fish.inc
end

set -x VOLTA_HOME "$HOME/.volta"
set -x PATH "$PATH" "$VOLTA_HOME/bin"

starship init fish | source

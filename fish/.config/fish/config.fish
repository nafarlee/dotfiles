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

if test -d "$HOME/homebrew/bin"
  set -x --append PATH "$HOME/homebrew/bin/"
end

if test -d "$HOME/google-cloud-sdk/bin"
  set -x --append PATH "$HOME/google-cloud-sdk/bin"
end

if test -d "$HOME/.rd/bin"
  set -x --append PATH "$HOME/.rd/bin"
end

if test -f /home/nafarlee/.cache/yay/google-cloud-sdk/pkg/google-cloud-sdk/opt/google-cloud-sdk/path.fish.inc
  source /home/nafarlee/.cache/yay/google-cloud-sdk/pkg/google-cloud-sdk/opt/google-cloud-sdk/path.fish.inc
end

if test -f $HOME/.asdf/asdf.fish
  source $HOME/.asdf/asdf.fish
end

if test -f $HOME/homebrew/opt/asdf/libexec/asdf.fish
  source $HOME/homebrew/opt/asdf/libexec/asdf.fish
end

starship init fish | source

if command -v nvim
  set -x EDITOR nvim
end

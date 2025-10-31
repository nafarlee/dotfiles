if command --query nvim
  set -x EDITOR nvim
end

set -gx VOLTA_HOME "$HOME/.volta"

fish_add_path "$VOLTA_HOME/bin"
fish_add_path ~/.cargo/bin
fish_add_path ~/.google-cloud-sdk/bin
fish_add_path ~/google-cloud-sdk/bin
fish_add_path /opt/homebrew/bin
fish_add_path ~/.rd/bin
fish_add_path ~/.local/bin
fish_add_path /opt/gerbil/bin
fish_add_path ~/.krew/bin

starship init fish | source

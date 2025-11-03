fish_add_path ~/.cargo/bin
fish_add_path ~/.google-cloud-sdk/bin
fish_add_path ~/google-cloud-sdk/bin
fish_add_path /opt/homebrew/bin
fish_add_path ~/.rd/bin
fish_add_path ~/.local/bin

starship init fish | source

if command --query nvim
  set -x EDITOR nvim
end

fish_add_path ~/.cargo/bin
fish_add_path ~/.google-cloud-sdk/bin
fish_add_path ~/google-cloud-sdk/bin
fish_add_path /opt/homebrew/bin
fish_add_path ~/.rd/bin

if test -f /home/nafarlee/.cache/yay/google-cloud-sdk/pkg/google-cloud-sdk/opt/google-cloud-sdk/path.fish.inc
  source /home/nafarlee/.cache/yay/google-cloud-sdk/pkg/google-cloud-sdk/opt/google-cloud-sdk/path.fish.inc
end

fish_add_path ~/.local/bin

starship init fish | source

if command --query nvim
  set -x EDITOR nvim
end

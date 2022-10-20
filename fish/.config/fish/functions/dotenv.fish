function dotenv
  for line in (cat $argv | grep -v '^\s*#' | grep -v '^\s*$')
    set item (string split -m 1 '=' $line)
    set -gx $item[1] $item[2]
  end
end

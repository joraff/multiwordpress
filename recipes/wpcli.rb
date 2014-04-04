wp_cli_latest = '/usr/bin/wp'

remote_file wp_cli_latest do
  source 'https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
  owner 'root'
  group 'root'
  mode 0755
end
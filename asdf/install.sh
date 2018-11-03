#!/bin/sh
#
# ASDF
#
# This installs ASDF language plugins

echo "Install ASDF Elixir Plugin"
asdf plugin-add elixir https://github.com/HashNuke/asdf-elixir.git

echo "Install ASDF Elixir Plugin"
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

echo "Install ASDF Elixir Plugin with keyring"
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

bash /usr/local/opt/asdf/plugins/nodejs/bin/import-release-team-keyring

echo "Finished getting ASDF language plugins"

exit 0

#!/bin/sh
#
# ASDF
#
# This installs ASDF language plugins

echo "Install ASDF Elixir Plugin"
asdf plugin-add elixir https://github.com/HashNuke/asdf-elixir.git

echo "Install ASDF Elixir Plugin"
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

echo "Install ASDF Nodejs Plugin with keyring"
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

echo "Install Ruby Plugin"
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

echo "Install and set global"
cd ~
asdf install
cd -


exit 0

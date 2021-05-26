#!/bin/bash
rm -rf burger_game
git clone https://github.com/petitejess/burger_game.git
gem install bundler
bundle install
cd burger_game/src/lib/
echo
echo
echo "Starting Burger Game..."
echo
echo
ruby burger_game.rb "$@"

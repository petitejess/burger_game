#!/bin/bash
rm -rf ruby-burger-game-app
git clone https://github.com/petitejess/ruby-burger-game-app.git
gem install burger_game
cd ruby-burger-game-app
echo
echo
echo "Starting Burger Game..."
echo
echo
ruby burger_game.rb "$@"

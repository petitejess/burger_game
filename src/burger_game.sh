#!/bin/bash

# Create start_burger_game.rb file (initialise class BurgerGame)
touch start_burger_game.rb
echo "require './lib/burger_game'" > start_burger_game.rb
echo "BurgerGame.new *ARGV.dup" >> start_burger_game.rb

# Run game with optional argument(s)
ruby start_burger_game.rb "$@"

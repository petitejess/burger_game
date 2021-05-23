#!/bin/bash
if ! gem list -i burger_game > /dev/null; then
  gem install burger_game
fi
if ! gem list -i bundler > /dev/null; then
  gem install bundler
fi
bundle install --quiet
ruby burger_game.rb "$@"

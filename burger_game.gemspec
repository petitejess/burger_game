Gem::Specification.new do |s|
  s.name        = 'burger_game'
  s.version     = '0.1.1'
  s.summary     = "A Ruby Burger Game"
  s.description = "A simple text-based Ruby terminal game, that simulates a burger shop, where you need to build the meal for the customers with different requests and preferences."
  s.authors     = ["Jessica Gozali"]
  s.email       = 'gcas012115@coderacademy.edu.au'
  s.files       = ["./burger_game.rb",
                   "./lib/customer_request.rb",
                   "./lib/game_state.rb",
                   "./lib/player_option.rb",
                   "./lib/recipe.rb",
                   "./lib/score_comparison.rb",
                   "./lib/screen_message.rb"]
  s.homepage    =
    'https://rubygems.org/gems/burger_game'
  s.license       = 'GPL-3.0'
  s.required_ruby_version = '~> 2.7'
  s.add_runtime_dependency 'bundler', '>= 2.1'
end
Gem::Specification.new do |s|
  s.name          = "burger_game"
  s.version       = "1.1.3"
  s.summary       = "A Ruby Burger Game"
  s.description   = "A simple text-based Ruby terminal game, that simulates a burger shop, where you need to build the meal for the customers with different requests and preferences."
  s.authors       = ["Jessica Gozali"]
  s.email         = "gcas012115@coderacademy.edu.au"
  s.require_paths = ["lib"]
  s.bindir        = "bin"
  s.executables   = ["start_burger_game"]
  s.files         = ["./burger_game.gemspec",
                     "./Gemfile",
                     "./Gemfile.lock",
                     "./LICENSE",
                     "./README.md",
                     "./bin/start_burger_game",
                     "./lib/burger_game.rb",
                     "./lib/customer_request.rb",
                     "./lib/game_state.rb",
                     "./lib/player_option.rb",
                     "./lib/recipe.rb",
                     "./lib/score_comparison.rb",
                     "./lib/screen_message.rb",
                     "./lib/customer_request.json",
                     "./lib/customer_response.json",
                     "./lib/recipe.json",
                     "./spec/burger_game_spec.rb"]
  s.homepage      =  "https://rubygems.org/gems/burger_game"
  s.license       =  "GPL-3.0"
  s.required_ruby_version = "~> 2.7"
  s.add_runtime_dependency "bundler", "~> 2.2"
  s.add_runtime_dependency "artii", "~> 2.1"
  s.add_runtime_dependency "colorize", "~> 0.8.1"
  s.add_runtime_dependency "json", "~> 2.5"
  s.add_runtime_dependency "rspec", "~> 3.10"
  s.add_runtime_dependency "tty-box", "~> 0.7.0"
  s.add_runtime_dependency "tty-prompt", "~> 0.23.1"
end

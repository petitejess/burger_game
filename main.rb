# # # Import Gems
# # require 'tty-prompt'

# require_relative './game_state'
# require_relative './screen_message'
# require_relative './recipe'
# require_relative './customer_request'
# require_relative './player_option'
# require_relative './score_comparison'

# # Create instance from GameState class
# game_play = GameState.new

# # Create instance from ScreenMessage class
# screen = ScreenMessage.new

# # Create instance of TTY Prompt
# prompt = TTY::Prompt.new

# # Feature 1
# puts
# puts screen.display_welcome
# screen.go_to_next
# user_input = gets.strip

# loop do
#   puts
#   user_input = prompt.select("What would you like to do?") do |menu|
#     menu.choice "View 'How to Play'"
#     menu.choice "Start Game"
#   end

#   break if user_input == "Start Game"

#   # Show instructions
#   puts
#   puts screen.display_instructions
  
#   screen.go_to_next
#   user_input = gets.strip
# end

# # Show prologue
# puts
# puts screen.display_prologue

# screen.go_to_next
# user_input = gets.strip

# # Display shop's Menu
# puts
# puts "Ruby Burger's Menu"
# puts 
# show_menu = Recipe.new
# i = 0
# loop do
#   puts show_menu.display_recipe(i)
#   i += 1
#   break if i > (Recipe::RECIPES.length - 1)
# end

# screen.go_to_next
# user_input = gets.strip

# # Display customer request
# puts
# puts "There is a customer in the queue..."
# puts
# customer_no = 0
# customer = CustomerRequest.new
# puts customer.display_request(customer_no)
# puts

# screen.go_to_next
# user_input = gets.strip

# # Display player's options
# options = PlayerOption.new
# player_recipe = options.get_options
# customer_recipe = customer.get_request(customer_no)

# # Calculate score
# compare = ScoreComparison.new(player_recipe, customer_recipe)
# customer_mood = compare.get_mood

# # Display customer's response
# puts
# puts "The customer wants to say something..."
# puts
# puts customer.display_response(customer_no, customer_mood)
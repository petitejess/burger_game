# require_relative './game_state'
# require_relative './screen_message'
# require_relative './recipe'
# require_relative './customer_request'
# require_relative './player_option'
# require_relative './score_comparison'

# # Initialise
# game_state = GameState.new
# show_menu = Recipe.new
# no_of_recipe = Recipe::RECIPES.length
# screen = ScreenMessage.new
# options = PlayerOption.new
# prompt = TTY::Prompt.new

# # Feature 1
# puts
# puts screen.display_welcome
# puts
# screen.go_to_next

# loop do
#   puts
#   start_game = options.get_start_game

#   break if start_game === true

#   # Show instructions
#   puts
#   puts screen.display_instructions
  
#   puts
#   screen.go_to_next
# end

# # Show prologue
# puts
# puts screen.display_prologue

# puts
# screen.go_to_next

# # Loop game until WIN / GAME OVER
# loop do
#   # Display current money and reputation status
#   puts game_state.display_game_state

#   puts
#   screen.go_to_next

#   # Display shop's Menu
#   puts
#   puts "Ruby Burger's Menu"
#   puts 
#   puts
#   puts "We have #{no_of_recipe} recipes. Try to remember the recipe name, the stack order of ingredients and the quantity. We will build the burger from bottom to top."
#   puts

#   i = 0
#   loop do
#     puts show_menu.display_recipe(i)

#     puts
#     screen.go_to_next

#     i += 1
#     break if i > (no_of_recipe - 1)
#   end

#   # Display customer request
#   puts
#   puts "There is a customer in the queue..."
#   puts
#   # Randomise customer
#   customer_no = rand(0..9)
#   customer = CustomerRequest.new
#   puts customer.display_request(customer_no)
#   puts

#   puts
#   screen.go_to_next

#   # Display player's options
#   player_recipe = options.get_options
#   customer_recipe = customer.get_request(customer_no)

#   # Calculate score
#   compare = ScoreComparison.new(player_recipe, customer_recipe)
#   score = compare.get_score
#   mood = compare.get_mood(score)
  
#   # Display customer's response
#   puts
#   puts "The customer wants to say something..."
#   puts
#   puts customer.display_response(customer_no, mood)

#   puts
#   screen.go_to_next

#   # Update game state
#   compare.calculate_state(mood)

#   # GAME OVER condition
#   if GameState.current_reputation == 0
#     puts screen.display_game_over
#     puts
#     screen.go_to_next
#     break
#   end

#   # WIN condition
#   if GameState.current_money >= GameState::TARGET_MONEY
#     puts screen.display_win
#     puts
#     screen.go_to_next
#     break
#   end
# end
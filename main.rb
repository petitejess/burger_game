# For command line argument
require 'optparse'
require 'ostruct'

require_relative './lib/game_state'
require_relative './lib/screen_message'
require_relative './lib/recipe'
require_relative './lib/customer_request'
require_relative './lib/player_option'
require_relative './lib/score_comparison'

# Initialise
game_state = GameState.new
show_menu = Recipe.new
no_of_recipe = Recipe.all_recipes.length
screen = ScreenMessage.new
player_options = PlayerOption.new
customer = CustomerRequest.new
options = OpenStruct.new

# Handle command line argument
opt_parser = OptionParser.new do |opt|
  opt.banner = "Usage: main.rb [options]"

  opt.on("-h", "--help", "Print this Help menu for Ruby Burger Game.") do |arg|
    puts opt
    exit
  end

  opt.on("-m", "--money TARGET_MONEY", screen.display_h_money) { |arg| options.target_money = arg }

  opt.on("-r", "--reputation MAX_REPUTATION", screen.display_h_reputation) { |arg| options.max_reputation = arg }
end

# ERROR HANDLING for command line argument
begin
  opt_parser.parse!
rescue OptionParser::InvalidOption => e
  puts "You have entered an invalid option. Please check the available options in our Help menu '-h' or '--help'."
  puts e.message
  exit
rescue OptionParser::MissingArgument => e
  puts "You have not entered the argument for your option."
  puts e.message
  exit
rescue OptionParser::ParseError => e
  puts "Error when parsing argument."
  puts e.message
  exit
rescue => e
  puts "Something went wrong."
  puts "Error message: " + e.message
  exit
end

if (options.target_money)
  if ((options.target_money.to_i >= 10 ) && (options.target_money.to_i <= 99 ))
    puts "Change TARGET_MONEY to: $#{options.target_money}.00."
    # Set target money in GameState
    game_state.set_target_money(options.target_money.to_f)
  else
    puts screen.display_invalid("for TARGET_MONEY.")
    exit
  end
  
end
if (options.max_reputation)
  if ((options.max_reputation.to_i >= 1 ) && (options.max_reputation.to_i <= 10 ))
    puts "Change MAX_REPUTATION to: #{options.max_reputation}."
    # Set max reputation in GameState
    game_state.set_max_reputation(options.max_reputation.to_i)
  else
    puts screen.display_invalid("for MAX_REPUTATION.")
    exit
  end
end

# Ask user if they want to launch the game or exit
puts
launch_game = player_options.get_launch_game
    
# Exit command line if user select Exit
exit if launch_game === false

# Show welcome message
puts
puts screen.display_welcome
puts
screen.go_to_next

# Feature 1: Options to see instructions or to start the game
loop do
  puts
  start_game = player_options.get_start_game

  break if start_game === true

  # Show instructions
  puts
  puts screen.display_instructions
  
  puts
  screen.go_to_next
end

# Show prologue
puts
puts screen.display_prologue

puts
screen.go_to_next

# Loop game until WIN / GAME OVER
loop do
  # Display current money and reputation status
  puts game_state.display_game_state

  puts
  screen.go_to_next

  # Feature 2: Formatted display for showing shop's menu
  puts
  puts "Ruby Burger's Menu"
  puts 
  puts
  puts "We have #{no_of_recipe} recipes. Try to remember the recipe name, the stack order of ingredients and the quantity. We will build the burger from bottom to top."
  puts

  # Loop to display all recipes
  i = 0
  loop do
    puts show_menu.display_recipe(i)

    puts
    screen.go_to_next

    i += 1
    break if i > (no_of_recipe - 1)
  end

  # Feature 3: Randomised customers with set of request (and associated preferences) and responses
  # Display customer request
  puts
  puts "There is a customer in the queue..."
  puts
  # Randomise customer
  customer_no = rand(0..9)
  puts customer.display_request(customer_no)
  puts

  puts
  screen.go_to_next

  # Feature 4: Selectable options for list of ingredients, so no manual entry (typing) is needed.
  # Quantity input as integer within a pre-set range.
  # Display player's options
  player_recipe = player_options.get_options
  customer_recipe = customer.get_request(customer_no)

  # Feature 5: Score calculation based on customer's request and preferences compared to player's input
  # Calculate score
  compare = ScoreComparison.new(player_recipe, customer_recipe)
  score = compare.get_score
  mood = compare.get_mood(score)
  
  # Feautre 6: Get customers' responses from a JSON file
  # Display customer's response
  puts
  puts "The customer wants to say something..."
  puts
  puts customer.display_response(customer_no, mood)

  puts
  screen.go_to_next
  puts

  # Update game state
  compare.calculate_state(mood)

  # Feature 7: Lose/win criteria based on reputation and money
  # GAME OVER condition
  if GameState.current_reputation == 0
    puts screen.display_game_over
    puts
    break
  end

  # WIN condition
  if GameState.current_money >= GameState.target_money
    puts screen.display_win
    puts
    break
  end
end
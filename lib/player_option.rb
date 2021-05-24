# Import Gems
require 'tty-prompt'

require_relative './recipe'

class PlayerOption
  def initialize
    # Create instance of TTY Prompt
    @prompt = TTY::Prompt.new
  end

  def launch_game
    player_response = @prompt.select("Do you want to launch the game?") do |menu|
      menu.choice "Launch Game"
      menu.choice "Exit"
    end

    if player_response == "Launch Game"
      true
    else
      false
    end
  end

  def start_game
    player_response = @prompt.select("What would you like to do?") do |menu|
      menu.choice "View 'How to Play'"
      menu.choice "Start Game"
    end

    if player_response == "Start Game"
      true
    else
      false
    end
  end

  def get_selection
    # Get ingredient names (array of strings)
    ingredient_names = []
    Recipe.ingredient_lists[0].each do |list|
      ingredient_names << list.keys.join
    end

    # Remove duplicate last value
    ingredient_names.pop

    # Variable to collect user input of item and quntity
    player_recipe = []

    # Loop prompt until player done selecting ingredients
    loop do
      # Loop through ingredients for player to choose
      puts
      item = @prompt.select("What would you like to add? (stack from bottom up)") do |item|
        ingredient_names.each do |ingredient|
          item.choice ingredient
        end

        # Option to finish selecting
        item.choice "Done"
      end

      # Exit loop if Done
      break if item === "Done"

      # Ask for quantity
      puts "How many \"#{item}\"? (Enter 0 to 5)"
      # Quantity input validation loop
      while quantity = gets.strip do
        # Must be a whole number 0 to 5
        if (quantity =~ /^[0-5]$/)
          break
        else
          puts "Please enter a number from 0 to 5:"
        end
      end

      # Collect player's selections
      player_recipe << { item => quantity.to_i }
    end

    # Array of ingredient-quantity hashes
    player_recipe
  end
end
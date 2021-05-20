# Import Gems
require 'tty-prompt'

require_relative './recipe'

class PlayerOption
  def initialize
  end

  def get_options
    # Create instance of TTY Prompt
    prompt = TTY::Prompt.new

    # Variable to collect user input of item and quntity
    player_recipe = []

    # Loop prompt until player done selecting ingredients
    loop do
      # Loop through ingredients for player to choose
      puts
      item = prompt.select("What would you like to add? (stack from bottom up)") do |item|
        Recipe::INGREDIENTS.each do |ingredient|
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

    player_recipe
  end
end
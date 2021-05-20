# Import Gems
require 'tty-prompt'

require_relative './recipe'
require_relative './selected_item'

class PlayerOption
  def initialize
  end

  # def add_selected(item, quantity)
  #   selected_item = SelectedItem.new(item, quantity)
  #   @selected_items << selected_item
  # end

  # def get_quantity(item)
  #   selected = @selected_items.find { |selected_item| selected_item.item === item}
  #   selected.quantity
  # end

  def get_options
    # Create instance of TTY Prompt
    prompt = TTY::Prompt.new

    # Variable to collect user input of item and quntity
    player_selections = []

    # Loop prompt until player done selecting ingredients
    loop do
      # Loop through ingredients for player to choose
      puts
      item = prompt.select("What would you like to add?") do |item|
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
      quantity = gets.strip.to_i

      # Collect player's selections
      player_selections << { item => quantity }
    end

    player_selections
  end
end
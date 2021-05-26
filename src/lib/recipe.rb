# Import Gems
require 'json'
require 'colorize'

require_relative './screen_message'

class Recipe
  # ERROR HANDLING for reading files
  begin
    # Read recipe.JSON file
    file = File.read('./data/recipe.json')
  rescue Errno::ENOENT => e
    puts "Could not find recipe.json file. Please put recipe.json in the 'data' directory."
    puts e.message
    exit
  rescue => e
    puts "Something went wrong."
    puts "Error message: " + e.message
    exit
  end
  
  # Parse JSON file into array
  @@all_recipes = JSON.parse(file)

  # Collect recipe names (array of strings)
  # and ingredient lists (array of arrays of hashes)
  @@recipe_names = []
  @@no_of_recipe = 0
  @@ingredient_lists = []
  @@all_recipes.each do |recipe|
    @@recipe_names << recipe.keys[0]
    recipe.each do |name, list|
      @@ingredient_lists << list
    end
  end
  @@no_of_recipe = @@recipe_names.length

  def initialize
  end

  def self.all_recipes
    all_recipes_copy = @@all_recipes.dup
  end

  def self.recipe_names
    @@recipe_names
  end

  def self.no_of_recipe
    @@no_of_recipe
  end

  def self.ingredient_lists
    @@ingredient_lists
  end

  def display_recipe(recipe_index)
    recipe_box = ScreenMessage.new
    spacing = ScreenMessage::SPACING

    # Put all string output lines in a variable
    recipe = @@recipe_names[recipe_index].center(spacing, " ").upcase + "\n\n" + "*".colorize(:blue) * spacing + "\n\n"

    @@ingredient_lists[recipe_index].each do |list|
      list.each do |item, quantity|
        recipe += "#{item}".rjust(spacing * 0.6) + " x #{quantity}".ljust(spacing * 0.4) + "\n"
      end
    end

    # Format output using frame
    recipe_box.recipe_frame(recipe)
  end
end
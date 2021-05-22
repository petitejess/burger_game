# Import Gems
require 'json'
require 'colorize'

require_relative './screen_message'

class Recipe
  # Read recipe.JSON file, parse into array
  file = File.read('./recipe.json')
  @@all_recipes = JSON.parse(file)

  # Collect recipe names (array of strings)
  # and ingredient lists (array of arrays of hashes)
  @@recipe_names = []
  @@ingredient_lists = []
  @@all_recipes.each do |recipe|
    @@recipe_names << recipe.keys[0]
    recipe.each do |name, list|
      @@ingredient_lists << list
    end
  end

  def initialize
  end

  def self.all_recipes
    all_recipes_copy = @@all_recipes.dup
  end

  def self.recipe_names
    @@recipe_names
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
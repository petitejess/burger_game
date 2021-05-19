# Import Gems
require 'tty-box'
require 'tty-screen'

class Recipe
  def initialize(name, ingredients)
    @name = name
    @ingredients = ingredients
  end

  # Method for displaying recipe frame
  def recipe_frame(name, list, height = 20)
    recipe_box = TTY::Box.frame({
      enable_color: true, # force to always color output
      width: 45,
      height: height,
      align: :center,
      padding: 3,
      style: {
        border: {
          fg: :white
        }
      }
    }) do
      puts name + "\n\n"
      puts list
      name
    end

    recipe_box
  end

  def display_recipe
    name = @name

    # Loop through ingredients
    list = []
    items = @ingredients.each do |ingredient|
      ingredient.map { |item, quantity| list.push("#{item}  x #{quantity}") }
    end

    recipe_frame(name, list)
  end
end
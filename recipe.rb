# Import Gems
require 'tty-box'
require 'colorize'

class Recipe
  # Constant variables for available recipes for the menu
  RECIPE_NAMES = ["Normal Burger", "Healthy Burger", "Questionable Burger"]
  INGREDIENTS = ["Bun", "Tomato Sauce", "Lettuce", "Grilled Chicken", "Cheese"]
  RECIPES = [{ RECIPE_NAMES[0] =>
              [{ INGREDIENTS[0] => 1 },
              { INGREDIENTS[1] => 1 },
              { INGREDIENTS[2] => 1 },
              { INGREDIENTS[3] => 1 },
              { INGREDIENTS[4] => 1 },
              { INGREDIENTS[0] => 1 }]
            },
            { RECIPE_NAMES[1] =>
              [{ INGREDIENTS[0] => 1 },
              { INGREDIENTS[4] => 1 },
              { INGREDIENTS[1] => 1 },
              { INGREDIENTS[3] => 2 },
              { INGREDIENTS[2] => 3 },
              { INGREDIENTS[0] => 1 }]
            },
            { RECIPE_NAMES[2] =>
              [{ INGREDIENTS[0] => 1 },
              { INGREDIENTS[4] => 3 },
              { INGREDIENTS[1] => 4 },
              { INGREDIENTS[3] => 4 },
              { INGREDIENTS[2] => 2 },
              { INGREDIENTS[0] => 1 }]
            }
          ]

  # Constant variable for display formatting space
  SPACING = 30

  def initialize
  end

  # Method for displaying recipe frame
  def recipe_frame(recipe)
    recipe_box = TTY::Box.frame({
      enable_color: true, # force to always color output
      width: SPACING + 10,
      align: :center,
      padding: 3,
      style: {
        border: {
          fg: :white
        }
      }
    }) do
      recipe
    end

    recipe_box
  end

  def display_recipe(recipe_index)
    # Put all string output lines in a variable
    recipe = RECIPE_NAMES[recipe_index].center(SPACING, " ").upcase + "\n\n" + "*".colorize(:blue) * SPACING + "\n\n"

    RECIPES[recipe_index][RECIPE_NAMES[recipe_index]].each do |list|
      list.each do |item, quantity|
        recipe += "#{item}".rjust(SPACING * 0.6) + " x #{quantity}".ljust(SPACING * 0.4) + "\n"
      end
    end

    # Format output using frame
    recipe_frame(recipe)
  end
end
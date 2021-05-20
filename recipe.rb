# Import Gems
require 'colorize'

require_relative './screen_message'

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

  def initialize
  end

  def display_recipe(recipe_index)
    recipe_box = ScreenMessage.new
    spacing = ScreenMessage::SPACING

    # Put all string output lines in a variable
    recipe = RECIPE_NAMES[recipe_index].center(spacing, " ").upcase + "\n\n" + "*".colorize(:blue) * spacing + "\n\n"

    RECIPES[recipe_index][RECIPE_NAMES[recipe_index]].each do |list|
      list.each do |item, quantity|
        recipe += "#{item}".rjust(spacing * 0.6) + " x #{quantity}".ljust(spacing * 0.4) + "\n"
      end
    end

    # Format output using frame
    recipe_box.recipe_frame(recipe)
  end
end
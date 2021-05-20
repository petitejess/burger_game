require_relative './customer_request'
require_relative './player_option'

class ScoreComparison
  def initialize(player_recipe, customer_recipe)
    @player_recipe = player_recipe
    @customer_recipe = customer_recipe
    @score = 0
  end

  def get_score
    # Reverse customer recipe (stacked from bottom up)
    r_customer_recipe = @customer_recipe.dup
    r_customer_recipe.reverse!

    # Compare recipe, score +1 for every correct ingredient-quantity (in order)
    @player_recipe.each_with_index do |line, i|
      line == r_customer_recipe[i] ? @score += 1 : @score
    end

    @score
  end
end
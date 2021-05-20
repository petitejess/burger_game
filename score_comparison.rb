require_relative './customer_request'
require_relative './player_option'
require_relative './game_state'

class ScoreComparison
  # Constant variable for max score and threshold
  MAX_SCORE = 6
  THRESHOLD = 3

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

  def get_mood
    # 6 happy
    # 3-5 neutral
    # <2 || >6 angry
    get_score
    if (@score <= MAX_SCORE)
      if (@score == MAX_SCORE)
        "happy"
      elsif (@score >= THRESHOLD)
        "neutral"
      else
        "angry"
      end
    else
      "angry"
    end
  end

  def calculate_state
    mood = get_mood
    money = GameState.current_money
    reputation = GameState.current_reputation
    max_reputation = GameState::MAX_REPUTATION

    if mood == "happy"
      money += 10
      if reputation < max_reputation
        reputation += 1
      end
    elsif mood == "neutral"
      money += 5
    else
      reputation -= 1
    end
    
    return money, reputation
  end
end
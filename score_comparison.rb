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

  def get_mood(score)
    # 6 happy
    # 3-5 neutral
    # <2 || >6 angry
    if (score <= MAX_SCORE)
      if (score == MAX_SCORE)
        "happy"
      elsif (score >= THRESHOLD)
        "neutral"
      else
        "angry"
      end
    else
      "angry"
    end
  end

  def calculate_state(mood)
    max_reputation = GameState.max_reputation
    payment = GameState::PAYMENT

    if mood == "happy"
      GameState.update_money(payment)
      if reputation < max_reputation
        GameState.update_reputation(1)
      end
    elsif mood == "neutral"
      GameState.update_money(payment / 2)
    else
      GameState.update_reputation(-1)
    end
    
    money = GameState.current_money
    reputation = GameState.current_reputation
    
    return money, reputation
  end
end
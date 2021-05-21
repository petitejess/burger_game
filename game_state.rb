require_relative './screen_message'

class GameState
  # Constant variables to hold target money and max reputation for gameplay
  TARGET_MONEY = 50.0
  MAX_REPUTATION = 10
  PAYMENT = 10.0

  def initialize
    @@current_money = 0.0
    @@current_reputation = MAX_REPUTATION
  end

  def self.current_money
    @@current_money
  end

  def self.current_reputation
    @@current_reputation
  end

  def self.update_money(payment)
    @@current_money += payment
  end
  
  def self.update_reputation(reputation)
    @@current_reputation += reputation
  end

  def display_game_state
    state_frame = ScreenMessage.new
    spacing = ScreenMessage::SPACING

    game_state = "MONEY / ".rjust((spacing / 2) + 1) + "Goal".ljust(spacing / 2)
    game_state += "$#{sprintf('%.2f', @@current_money)} / ".rjust((spacing / 2) + 1) + "$#{sprintf('%.2f', TARGET_MONEY)}".ljust(spacing / 2) + "\n\n"
    game_state += "+".colorize(:red) * spacing + "\n\n"
    game_state += "REPUTATION / ".rjust((spacing / 2) + 1) + "Max Reputation".ljust(spacing / 2)
    game_state += "#{@@current_reputation} / ".rjust((spacing / 2) + 1) + "#{MAX_REPUTATION}".ljust(spacing / 2) + "\n\n "
    
    state_frame.recipe_frame(game_state)
  end
end
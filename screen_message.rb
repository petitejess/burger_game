# Import Gems
require 'tty-box'
require 'tty-screen'
require 'tty-prompt'

class ScreenMessage
  # Constant variable for display formatting space
  SPACING = 30

  def initialize
  end

  def display_h_money
    msg = "Change TARGET_MONEY.\n\t\t\t\t\tThe lower the value, the easier to WIN.\n\t\t\t\t\tDefault is 50. Enter number 10 to 99.\n\t\t\t\t\tUsage example: -m 10"
  end

  def display_h_reputation
    msg = "Change MAX_REPUTATION.\n\t\t\t\t\tThe lower the value, the easier to GAME OVER.\n\t\t\t\t\tDefault is 10. Enter number 1 to 10.\n\t\t\t\t\tUsage example: -r 2"
  end

  def display_invalid(input = "")
    msg = "You have entered an invalid value #{input}\nPlease enter the value in a valid format. Use -h or --help to view Help menu.\n"
  end

  def go_to_next
    # Create instance of TTY Prompt
    prompt = TTY::Prompt.new

    prompt.select("Press enter to continue.", %w(Next))
  end

  # Method for displaying message frame
  def msg_frame(title, msg, height = 10)
    msg_box = TTY::Box.frame({
      enable_color: true, # force to always color output
      width: 150,
      height: height,
      align: :center,
      padding: 3,
      style: {
        border: {
          fg: :white
        }
      },
      border: :thick,
      title: {
        top_left: title
      }
    }) do
      msg
    end

    msg_box
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
  
  def display_welcome
    title = "   WELCOME   "
    msg = "Hello there... Welcome to Ruby Burger!\n\n\n~ END ~"
    height = 13

    # Format output using frame
    msg_frame(title, msg, height)
  end

  def display_instructions
    title = "   HOW TO PLAY   "
    msg = "Instructions:\n\n1. When shop's Menu is displayed, memorise burger names, ingredients and quantity needed, and ingredients stack order.\n\n2. Customer's request will consists of the name of the burger, and custom preferences, such as 'no sauce' or 'extra 1 patty'.\n\n3. Enter ingredient and quantity needed in order, from bottom of the stack to the top.\n\n4. Keep customers happy and earn money to meet the target (You Win).\n\n5. Be careful not to make the customer angry and let your reputation get to 0 (Game Over).\n\n\n~ END ~"
    height = 23

    # Format output using frame
    msg_frame(title, msg, height)
  end
  
  def display_prologue
    title = "   PROLOGUE   "
    msg = "Ruby Burger is dedicated in fulfilling the ever growing customers' demand of customised and personalised burgers.\n\nOur job is to build a burger following our shop's Menu recipes, while adjusting into different customers' preferences.\n\n In the next scene, we will memorise our Menu and recipes.\n\nHint: Memorise burger names, ingredients and quantity needed, and ingredients stack order. Build burger from bottom up. Enter ingredients from the bottom of the stack to the top as seen in the recipes.\n\n\n~ END ~"
    height = 19

    # Format output using frame
    msg_frame(title, msg, height)
  end

  def display_win
    title = "   YOU WIN   "
    msg = "Ruby Burger has reached its goal!\n\nAll thanks to you and your brilliant burger stacking skill.\nNow is time to celebrate and give yourself a reward..." + "\n\n"
    msg += "A burger... and chips!" + "\n\n"

    msg += "                            |\\ /| /|_/|" + "\n"
    msg += "                          |\\||-|\\||-/|/|" + "\n"
    msg += "                           \\\\|\\|//||///" + "\n"
    msg += "          _..----.._       |\\/\\||//||||" + "\n"
    msg += "        .'     o    '.     |||\\\\|/\\\\ ||" + "\n"
    msg += "       /   o       o  \\    | './\\_/.' |" + "\n"
    msg += "      |o        o     o|   |          |" + "\n"
    msg += "      /'-.._o     __.-'\\   |          |" + "\n"
    msg += "      \\      `````     /   |          |" + "\n"
    msg += "     |``--........--'`|    '.______.'" + "\n"
    msg += "\\              /          " + "\n"
    msg += "jgs  `'----------'`              " + "\n\n"

    msg += "-- all ASCII artwork copyrighted ©1996-01 -- Joan G. Stark -- All Rights Reserved --" + "\n\n"
    msg += "\n\n\n~ END ~"

    height = 35

    # Format output using frame
    msg_frame(title, msg, height)
  end

  def display_game_over
    title = "   GAME OVER   "
    msg = "Oh no! Everyone is leaving because you didn't stack the right burgers!\n\nOwning a burger shop, especially a Ruby one, is tough.\nYou need to practice hard (or just use the handicap ARGV in command line, read the instruction in the installation guide in README.md).\n\nDon't give up! You can always try again next time!" + "\n\n"
    msg += "You are lucky this is just a game..."
    msg += "\n\n\n~ END ~"
    height = 20

    # Format output using frame
    msg_frame(title, msg, height)
  end
end
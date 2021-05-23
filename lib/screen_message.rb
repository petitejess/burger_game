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
      width: 80,
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
    msg = "Hello there... Welcome to Ruby Burger!" + "\n\n"
    msg += "We are going to build burgers for customers." + "\n"
    msg += "Clear your mind, put on your best smile..." + "\n"
    msg += "And... we're ready to stack 'em burgers!"
    msg += "\n\n\n~ END ~"
    height = 16

    # Format output using frame
    msg_frame(title, msg, height)
  end

  def display_instructions
    title = "   HOW TO PLAY   "
    msg = "Instructions:\n\n1. When shop's Menu is displayed, memorise \"burger names\", \"ingredients\" and \"quantity\" needed, and ingredients \"stack order\"." + "\n\n"
    msg += "2. Customer's request will consists of the \"name of the burger\", and custom \"preferences\", such as 'no sauce' or 'extra 1 patty'." + "\n\n"
    msg += "3. Select ingredient and quantity needed in order, from \"bottom\" of the stack \"to the top\". Enter \"0\" for requests that ask to leave some ingredients out because we need to keep the correct order of the stack." + "\n\n"
    msg += "4. When you build the burger perfectly as per customer request, the happy customer will increase your reputation by 1 point and pay $10 for the burger. Otherwise, if you miss a thing or two, but still acceptable, the pay would be halved but no reputation points given. If you fail to make a decent burger for the customer, the angry customer will not pay and they will take 1 point off your reputation." + "\n\n"
    msg += "5. Keep enough customers happy and earn money to meet the target (You Win). Be careful not to make too many customers angry and let your reputation get to 0 (Game Over).\n\n\n~ END ~"
    height = 34

    # Format output using frame
    msg_frame(title, msg, height)
  end
  
  def display_prologue
    title = "   PROLOGUE   "
    msg = "Ruby Burger is dedicated in fulfilling the ever growing customers' demand of customised and personalised burgers.\n"
    msg += "Our job is to build a burger following our shop's Menu recipes, while adjusting into different customers' preferences.\n"
    msg += "In the next scene, we will memorise our Menu and recipes." + "\n\n"
    msg += "Hint:\n"
    msg += "Memorise \"burger names\", \"ingredients\" and \"quantity\" needed, and ingredients \"stack order\".\n"
    msg += "Build burger from \"bottom up\". Select ingredients from the bottom of the stack to the top as seen in the recipes.\n"
    msg += "Enter \"0\" for requests that ask to leave some ingredients to keep the correct order of the stack."
    msg += "\n\n\n~ END ~"
    height = 24

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
    msg += "jgs  `'----------'`              " + "\n\n\n"

    msg += "-- all ASCII artwork copyrighted ©1996-01 --" + "\n"
    msg += "Joan G. Stark" + "\n"
    msg += "-- All Rights Reserved --" + "\n\n"
    msg += "\n~ END ~"

    height = 35

    # Format output using frame
    msg_frame(title, msg, height)
  end

  def display_game_over
    title = "   GAME OVER   "
    msg = "Oh no! Everyone is leaving because you didn't stack the right burgers!" + "\n\n"
    msg += "Owning a burger shop, especially a Ruby one, is tough.\n"
    msg += "You need to practice hard (or just use the handicap ARGV in command line, read the instruction in the installation/usage guide in README.md).\n\nDon't give up! You can always try again next time!" + "\n\n"
    msg += "You are lucky this is just a game..."
    msg += "\n\n\n~ END ~"
    height = 20

    # Format output using frame
    msg_frame(title, msg, height)
  end
end
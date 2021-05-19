# Import Gems
require 'tty-box'
require 'tty-screen'

class ScreenMessage
  def initialize
  end

  def go_to_next
    puts "\nPress ENTER to continue.\n"
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
  
  def display_welcome
    title = "   WELCOME   "
    msg = "Hello there... Welcome to Ruby Burger!\n\n\n~ END ~"
    height = 13
    msg_frame(title, msg, height)
  end

  def display_instructions
    title = "   HOW TO PLAY   "
    msg = "Instructions:\n\n1. When shop's Menu is displayed, memorise burger names, ingredients and quantity needed, and ingredients stack order.\n\n2. Customer's request will consists of the name of the burger, and custom preferences, such as 'no sauce' or 'extra 1 patty'.\n\n3. Enter ingredient and quantity needed in order, from bottom of the stack to the top.\n\n4. Keep customers happy and earn money to meet the target (You Win).\n\n5. Be careful not to make the customer angry and let your reputation get to 0 (Game Over).\n\n\n~ END ~"
    height = 23
    msg_frame(title, msg, height)
  end
  
  def display_prologue
    title = "   PROLOGUE   "
    msg = "Ruby Burger is dedicated in fulfilling the ever growing customers' demand of customised and personalised burgers.\n\nOur job is to build a burger following our shop's Menu recipes, while adjusting into different customers' preferences.\n\n In the next scene, we will memorize our Menu and recipes.\n\nHint: Memorise burger names, ingredients and quantity needed, and ingredients stack order. Build burger from bottom up. Enter ingredients from the bottom of the stack to the top as seen in the recipes.\n\n\n~ END ~"
    height = 19
    msg_frame(title, msg, height)
  end
end
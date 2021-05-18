# Import TTY Gems
require 'tty-box'
require 'tty-screen'

class ScreenMessage

  def initialize
  end

  def msg_frame(title, msg, height = 10)
    msg_box = TTY::Box.frame({
      enable_color: true, # force to always color output
      width: TTY::Screen.width - 1,
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

    puts msg_box
  end
  
  def display_welcome
    title = " WELCOME "
    msg = "Hello there... Welcome to Ruby Burger!"
    msg_frame(title, msg)
  end

  def display_instructions
    title = " HOW TO PLAY "
    msg = "Instructions"
    msg_frame(title, msg)
  end
  
  def display_prologue
    title = " PROLOGUE "
    msg = "Once upon a time ..."
    msg_frame(title, msg)
  end
end

msg = ScreenMessage.new
msg.display_welcome
msg.display_instructions
msg.display_prologue
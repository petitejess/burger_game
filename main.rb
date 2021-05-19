# # Import Gems
# require 'tty-prompt'

# require_relative './screen_message'

# # Create instance from ScreenMessage class
# screen = ScreenMessage.new

# # Create instance of TTY Prompt
# prompt = TTY::Prompt.new

# # Feature 1
# puts
# puts screen.display_welcome
# screen.go_to_next
# user_input = gets.strip

# loop do
#   puts
#   user_input = prompt.select("What would you like to do?") do |menu|
#     menu.choice "View 'How to Play'"
#     menu.choice "Start Game"
#   end

#   break if user_input == "Start Game"

#   # Show instructions
#   puts
#   puts screen.display_instructions
  
#   screen.go_to_next
#   user_input = gets.strip
# end

# # Show prologue
# puts
# puts screen.display_prologue

# screen.go_to_next
# user_input = gets.strip

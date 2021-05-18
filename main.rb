require_relative './screen_message'

# Create instance from ScreenMessage class
screen = ScreenMessage.new

# Feature 1
loop do
  puts screen.display_welcome
  
  user_input = gets.strip
  break if user_input == 'next'
end

loop do
  puts "Do you want to view the game instructions? Type 'next' to skip."
  user_input = gets.strip
  break if user_input == 'next'

  # Show instructions
  puts screen.display_instructions
  
  user_input = gets.strip
  break if user_input == 'next'
end

loop do
  # Show prologue
  puts screen.display_prologue

  user_input = gets.strip
  break if user_input == 'next'
end
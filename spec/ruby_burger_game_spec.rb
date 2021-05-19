require_relative '../main'
require_relative '../screen_message'
require_relative '../recipe'
require_relative '../player_option'

# # Test case for Feature 1
# describe ScreenMessage do
#   # This block runs before each test case defined in 'it' block
#   before(:each) do
#     @screen_message = ScreenMessage.new
#   end

#   it "check if display_welcome is defined" do
#     expect(@screen_message.display_welcome.class).to eq(String)
#   end

#   it "check if display_instructions is defined" do
#     expect(@screen_message.display_instructions.class).to eq(String)
#   end

#   it "check if display_prologue is defined" do
#     expect(@screen_message.display_prologue.class).to eq(String)
#   end
# end

# # Test case for Feature 2
# describe Recipe do
#   # This block runs before each test case defined in 'it' block
#   before(:each) do
#     @name = "Basic Burger"
#     @ingredients = [{ "Bun" => 1 }, { "Tomato Sauce" => 1 }, { "Lettuce" => 1 }, { "Grilled Chicken" => 2 }, { "Cheese" => 1 }, { "Bun" => 1 }]
#     @recipe = Recipe.new(@name, @ingredients)
#   end

#   it "should display the recipe" do
#     expect(@recipe.display_recipe.class).to eq(String)
#   end

#   it "should return the recipe ingredients" do
#     expect(@recipe.get_ingredients(@name)).to eq(@ingredients)
#   end
# end

# Test case for Feature 4
describe PlayerOption do
  before(:each) do
    options = ["Bun", "Tomato Sauce", "Lettuce", "Grilled Chicken", "Cheese"]
    @options = PlayerOption.new(options)
  end

  it "should display player's options" do
    expect(@options.display_options.class).to eq(String)
  end
end
require_relative '../main'
require_relative '../screen_message'
require_relative '../recipe'
require_relative '../selected_item'
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

# Test case for MAIN FEATURES: Feature 4
describe SelectedItem do
  # This block runs before each test case defined in 'it' block
  before(:each) do
    @item = "Tomato Sauce"
    @quantity = 2
    @selected_item = SelectedItem.new(@item, @quantity)
  end

  it "should return quantity of the selected item from options" do
    expect(@selected_item.quantity).to be(@quantity)
  end

  it "should return the item selected" do
    expect(@selected_item.item).to eq(@item)
  end
end

describe PlayerOption do
  # This block runs before each test case defined in 'it' block
  before(:each) do
    options = ["Bun", "Tomato Sauce", "Lettuce", "Grilled Chicken", "Cheese"]
    @item = "Bun"
    @quantity = 2
    @options = PlayerOption.new(options)
  end

  it "should display player's options" do
    expect(@options.display_options.class).to eq(String)
  end

  it "should get the quantity entered for selected item" do
    @options.add_selected(@item, @quantity)
    expect(@options.get_quantity(@item)).to be(@quantity)
  end
end
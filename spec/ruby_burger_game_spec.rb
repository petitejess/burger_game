require_relative '../main'
require_relative '../screen_message'
require_relative '../recipe'
require_relative '../selected_item'
require_relative '../player_option'
require_relative '../customer_request'

# # Test case for Feature 1
describe ScreenMessage do
  # This block runs before each test case defined in 'it' block
  before(:each) do
    @screen_message = ScreenMessage.new
  end

  it "check if display_welcome is defined" do
    expect(@screen_message.display_welcome.class).to eq(String)
  end

  it "check if display_instructions is defined" do
    expect(@screen_message.display_instructions.class).to eq(String)
  end

  it "check if display_prologue is defined" do
    expect(@screen_message.display_prologue.class).to eq(String)
  end
end

# Test case for Feature 2
describe Recipe do
  it "should display the recipe" do
    recipe = Recipe.new
    recipe_no = 1
    expect(recipe.display_recipe(recipe_no).class).to eq(String)
  end
end

# Test case for MAIN FEATURES: Feature 3
describe CustomerRequest do
  it "should display customer request" do
    customer = CustomerRequest.new
    customer_no = 0
    expect(customer.display_request(customer_no).class).to eq(String)
  end
end

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
    @player_selections = PlayerOption.new
  end

  it "should get player's options" do
    expect(@player_selections.get_options.class).to eq(Array)
  end
end
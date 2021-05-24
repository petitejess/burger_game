require_relative '../burger_game'
require_relative '../lib/screen_message'
require_relative '../lib/recipe'
require_relative '../lib/player_option'
require_relative '../lib/customer_request'
require_relative '../lib/score_comparison'
require_relative '../lib/game_state'

# Test case for Feature 1
# and for MAIN FEATURES: Feature 7
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

  it "check if display_win is defined" do
    expect(@screen_message.display_win.class).to eq(String)
  end

  it "check if display_win is defined" do
    expect(@screen_message.display_game_over.class).to eq(String)
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

# Test case for Feature 3
# and for Feature 6
describe CustomerRequest do
  # This block runs before each test case defined in 'it' block
  before(:each) do
    @customer = CustomerRequest.new
    @customer_no = 1
  end

  it "should display customer request" do
    expect(@customer.display_request(@customer_no).class).to eq(String)
  end

  it "should display customer response" do
    mood = "angry"
    expect(@customer.display_response(@customer_no, mood).class).to eq(String)
  end
end

# Test case for MAIN FEATURES: Feature 4
describe PlayerOption do
  # This block runs before each test case defined in 'it' block
  before(:each) do
    @player_selections = PlayerOption.new
  end

  it "should launch the game" do
    expect(@player_selections.launch_game.class).to be(TrueClass) | be(FalseClass)
  end

  it "should start the game" do
    expect(@player_selections.start_game.class).to be(TrueClass) | be(FalseClass)
  end

  it "should get player's options" do
    expect(@player_selections.get_selection.class).to eq(Array)
  end
end

# Test case for MAIN FEATURES: Feature 5
describe ScoreComparison do
  # This block runs before each test case defined in 'it' block
  before(:each) do
    player_recipe = [{ "Bun" => 1 }, { "Lettuce" => 2}, { "Grilled Chicken" => 2 }, { "Tomato Sauce" => 4 }, { "Cheese" => 3 }]
    customer_no = 1
    customer = CustomerRequest.new
    @compare = ScoreComparison.new(player_recipe, customer.get_request(customer_no))
  end

  it "should calculate score for player input and customer request comparison" do
    expect(@compare.get_score).to be(4)
  end

  it "should get correct customer mood" do
    expect(@compare.get_mood(@compare.get_score)).to eq("neutral")
  end
end

describe GameState do
  # This block runs before each test case defined in 'it' block
  before(:each) do
    player_recipe = [{ "Bun" => 1 }, { "Lettuce" => 2 }, { "Grilled Chicken" => 2 }, { "Tomato Sauce" => 4 }, { "Cheese" => 3 }]
    customer_no = 1
    customer = CustomerRequest.new
    @compare = ScoreComparison.new(player_recipe, customer.get_request(customer_no))
    @game_state = GameState.new
  end

  it "should get current money level" do
    score = @compare.get_score
    mood = @compare.get_mood(score)
    expect(@compare.calculate_state(mood)[0]).to be(5.0)
  end

  it "should get current reputation level" do
    expect(@compare.calculate_state(@compare.get_mood(@compare.get_score))[1]).to be(10)
  end

  it "should display game state" do
    expect(@game_state.display_game_state.class).to eq(String)
  end
end
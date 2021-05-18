require_relative '../main.rb'
require_relative '../screen_message.rb'

# Test case for Feature 1
describe ScreenMessage do
  # This block runs before each test case defined in 'it' block
  before(:each) do
    @screen_message = ScreenMessage.new
  end

  it 'check if display_welcome is defined' do
    expect(@screen_message.display_welcome.class).to eq(String)
  end

  it 'check if display_instructions is defined' do
    expect(@screen_message.display_instructions.class).to eq(String)
  end

  it 'check if display_prologue is defined' do
    expect(@screen_message.display_prologue.class).to eq(String)
  end
end
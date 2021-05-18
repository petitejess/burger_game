require_relative '../main.rb'
require_relative '../screen_message.rb'

# Test case for Feature 1
describe ScreenMessage do
    # This block runs before each test case defined in 'it' block
    before(:each) do
        @screen_message = ScreenMessage.new
    end

    it 'should display a welcome message' do
        message = "Hello"
        expect(@screen_message.display_welcome).to eq(message)
    end

    it 'should display a How to Play instructions message' do
        message = "How to Play"
        expect(@screen_message.display_instructions).to eq(message)
    end

    it 'should display a prologue message' do
        message = "Prologue"
        expect(@screen_message.display_prologue).to eq(message)
    end
end
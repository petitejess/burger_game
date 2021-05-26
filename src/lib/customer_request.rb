require_relative './recipe'
require_relative './screen_message'

class CustomerRequest
  # ERROR HANDLING for reading files
  begin
    # Read customer_request.JSON file
    customer_file = File.read(File.join(File.dirname(__FILE__), './customer_request.json'))
    
  rescue Errno::ENOENT => e
    puts "Could not find customer_request.json file. Please put customer_request.json in the 'data' directory."
    puts e.message
    exit
  rescue => e
    puts "Something went wrong."
    puts "Error message: " + e.message
    exit
  end
  
  begin
    # Read customer_response.JSON file
    response_file = File.read(File.join(File.dirname(__FILE__), './customer_response.json'))
    
  rescue Errno::ENOENT => e
    puts "Could not find customer_response.json file. Please put customer_response.json in the 'data' directory."
    puts e.message
    exit
  rescue => e
    puts "Something went wrong."
    puts "Error message: " + e.message
    exit
  end
  
  # Parse JSON file into array
  @@all_customers = JSON.parse(customer_file)
  @@customer_responses = JSON.parse(response_file)

  # Collect customer names (array of strings)
  # and number of customers
  # and customer recipe names request (array of strings)
  # and customer ingredient changes (array of hashes)
  # and customer requests text (array of strings)
  # and customer preferences text (array of strings)
  @@customer_names = []
  @@no_of_customer = 0
  @@customer_recipe_names = []
  @@customer_ingredient_changes = []
  @@customer_requests_text = []
  @@customer_preferences_text = []
  @@all_customers.each do |customer|
    customer.each do |name, request|
      @@customer_names << name
      @@customer_recipe_names << request[0].keys[0]
      @@customer_ingredient_changes << request[0].values[0][0]
      @@customer_requests_text << request[1].values.join
      @@customer_preferences_text << request[2].values.join
    end
  end
  @@no_of_customer = @@customer_names.length

  # Collect customer responses (array of arrays of hashes)
  @@responses = []
  @@customer_responses.each do |responses|
    @@responses << responses.values
  end

  def initialize
  end

  def self.no_of_customer
    @@no_of_customer
  end

  def get_request(customer_no)
    # Get all original recipes for base recipes (array of hashes)
    base_recipes = Recipe.all_recipes

    # Create customer recipe based on preference (array of hashes)
    customer_recipe = []
    requested_recipe_name = @@customer_recipe_names[customer_no]
    requested_ingredient = @@customer_ingredient_changes[customer_no]
    base_recipes.each do |recipe|
      if recipe.key?(requested_recipe_name)
        customer_recipe = recipe[requested_recipe_name].dup # => Not yet changed
        # Change here
        customer_recipe.each_with_index do |list, i|
          if list.keys === requested_ingredient.keys
            customer_recipe[i] = requested_ingredient
          end
        end
      end
    end
    
    # Array of ingredient-quantity hashes
    customer_recipe
  end

  def display_request(customer_no)
    # Initialise frame for output formatting
    dialog_box = ScreenMessage.new
    customer_name = @@customer_names[customer_no]
    customer_request_text = @@customer_requests_text[customer_no]
    customer_preference_text = @@customer_preferences_text[customer_no]

    # Put all string output lines in a variable
    msg = ""
    msg += customer_request_text
    msg += "\n"
    msg += customer_preference_text

    # Format output using frame
    dialog_box.msg_frame(customer_name, msg)
  end

  def display_response(customer_no, mood)
    # Initialise frame for output formatting
    dialog_box = ScreenMessage.new
    customer_name = @@customer_names[customer_no]
    customer_response = @@responses[customer_no]

    # Put all string output lines in a variable
    msg = ""
    customer_response.each do |response|
      response.each do |type, text|
        msg += text if mood === type
      end
    end
    
    # Format output using frame
    dialog_box.msg_frame(customer_name, msg)
  end
end
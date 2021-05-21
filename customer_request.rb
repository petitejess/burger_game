require_relative './recipe'
require_relative './screen_message'

class CustomerRequest
  def initialize
  end
  
  # Constant variables for customer details
  CUSTOMER_NAMES = ["   A Customer   ",
                    "   Captain Australia   ",
                    "   John Citizen   ",
                    "   Jane Citizen   ",
                    "   Scott Morris   ",
                    "   The Mighty Princess   ",
                    "   Donald T.   ",
                    "   Mickey M.   ",
                    "   Unicorn   ",
                    "   A Robot   "]

  CUSTOMER_PREFERENCES = [{ "no cheese, thank you!" => [{ Recipe::INGREDIENTS[4] => 0 }]},
                          { "one extra patty please!" => [{ Recipe::INGREDIENTS[3] => 5 }]},
                          { "no veggie please!" => [{ Recipe::INGREDIENTS[2] => 0 }]},
                          { "no chicken please!" => [{ Recipe::INGREDIENTS[3] => 0 }]},
                          { "extra two slices of cheese please!" => [{ Recipe::INGREDIENTS[4] => 5 }]},
                          { "extra one lettuce please!" => [{ Recipe::INGREDIENTS[2] => 4 }]},
                          { "no lettuce!! Please!!" => [{ Recipe::INGREDIENTS[2] => 0 }]},
                          { "double tomato sauce please!" => [{ Recipe::INGREDIENTS[1] => 2 }]},
                          { "no tomato sauce..." => [{ Recipe::INGREDIENTS[1] => 0 }]},
                          { "triple patty please!" => [{ Recipe::INGREDIENTS[3] => 3 }]}
                        ]

  CUSTOMER_REQUESTS = [[CUSTOMER_NAMES[0], Recipe::RECIPE_NAMES[0], CUSTOMER_PREFERENCES[0]],
                       [CUSTOMER_NAMES[1], Recipe::RECIPE_NAMES[2], CUSTOMER_PREFERENCES[1]],
                       [CUSTOMER_NAMES[2], Recipe::RECIPE_NAMES[1], CUSTOMER_PREFERENCES[2]],
                       [CUSTOMER_NAMES[3], Recipe::RECIPE_NAMES[1], CUSTOMER_PREFERENCES[3]],
                       [CUSTOMER_NAMES[4], Recipe::RECIPE_NAMES[2], CUSTOMER_PREFERENCES[4]],
                       [CUSTOMER_NAMES[5], Recipe::RECIPE_NAMES[1], CUSTOMER_PREFERENCES[5]],
                       [CUSTOMER_NAMES[6], Recipe::RECIPE_NAMES[2], CUSTOMER_PREFERENCES[6]],
                       [CUSTOMER_NAMES[7], Recipe::RECIPE_NAMES[1], CUSTOMER_PREFERENCES[7]],
                       [CUSTOMER_NAMES[8], Recipe::RECIPE_NAMES[2], CUSTOMER_PREFERENCES[8]],
                       [CUSTOMER_NAMES[9], Recipe::RECIPE_NAMES[0], CUSTOMER_PREFERENCES[9]]
                      ]

  def get_request(customer_no)
    all_recipes = Recipe::RECIPES # => array of all available recipes (hash of hashes)
    requested_recipe_name = CUSTOMER_REQUESTS[customer_no][1] # => recipe name (string)

    # Get requested actual recipe (array of hashes)
    actual_recipe = []
    all_recipes.each do |recipe|
      if recipe.keys.join == requested_recipe_name
        actual_recipe = recipe[requested_recipe_name]
      end
    end

    # Variable to hold hash of customer preference (array with single hash)
    requested_preference = []
    CUSTOMER_PREFERENCES[customer_no].each { |text, preference| requested_preference = preference }
    
    # Replace actual recipe with customer preference:
    # 1. Get preference ingredient name (string)
    ingredient = requested_preference[0].keys.join

    # 2. Replace quantity value of the line in actual recipe which key matches preference ingredient name
    customer_recipe = actual_recipe.dup

    customer_recipe.each do |line|
      if line.keys == requested_preference[0].keys
        line[ingredient] = requested_preference[0][ingredient]
      end
    end
    
    # Array of ingredient-quantity hashes
    customer_recipe
  end

  def display_request(customer_no)
    dialog_box = ScreenMessage.new
    customer_request = CUSTOMER_REQUESTS[customer_no]

    # Put all string output lines in a variable
    request_text = "Can I have \"" + customer_request[1] + "\" today?\n"
    request_text += "With " + customer_request[2].keys[0]

    # Format output using frame
    dialog_box.msg_frame(customer_request[0], request_text)
  end

  def display_response(customer_no, mood)
    dialog_box = ScreenMessage.new
    customer_request = CUSTOMER_REQUESTS[customer_no]
    response = ""

    response = case mood
                when "happy"
                  "Delicious! You're the best! Here take my money!"
                when "neutral"
                  "Hmm... The food here is not worth the price..."
                else
                  "GRRRRR!! What is THIS?! I don't even!! I hope you close down!!"
                end

    # Format output using frame
    dialog_box.msg_frame(customer_request[0], response)
  end
end
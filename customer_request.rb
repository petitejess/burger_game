# Import Gems
require 'tty-box'

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
                    "   A. Robot   "]

  CUSTOMER_PREFERENCES = [{ "Thank you!" => [] },
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

  def display_request(customer_no)
    dialog_box = ScreenMessage.new
    customer_request = CUSTOMER_REQUESTS[customer_no]

    # Put all string output lines in a variable
    request_text = "Can I have \"" + customer_request[1] + "\" today?\n"
    preference_prefix = customer_request[2].values[0].empty? ? "" : "With "
    request_text += preference_prefix + customer_request[2].keys[0]

    # Format output using frame
    dialog_box.msg_frame(customer_request[0], request_text)
  end
end
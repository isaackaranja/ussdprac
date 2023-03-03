# require '/lib_screens'
require 'screens/lib_screens'


# $screen_dict = {name: "EnterName", age: "Age", product: "Product"}

class EnterName <  InputScreen

  @response        = 'CON Create an Account\n" + " Enter User Name \n'
  @next_screen     = 'Age'

  # def response
  #   response = 'CON Create an Account\n" + " Enter User Name \n'
  # end

  # def handle_input(user_input)
  #   Age.to_s
  # end

end

class Age < InputScreen

  @response    = "CON Age \n" + "Enter Age \n"
  @next_screen = 'Product'

end

class Product < InputScreen

  @response    = "CON Register Product \n"
  @next_screen = 'ProductUnit'

end

class ProductUnit < MenuInputScreen

  @response     = "CON 1. Enter product unit \n 0. Go back"
  @next_screen  = 'Unit'
  @menu_options = {
    '0' => Product.to_s,
    '1' => Age.to_s
  }
end


class Unit < EndScreen
  response = "Product successfully created \n Thank you"
end








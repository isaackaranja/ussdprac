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

class ProductUnit < InputScreen

  @response     = "CON 1. Enter product unit \n 0. Go back"
  @next_screen  = 'Unit'
  # @menu_options = {
  #   '0' => Product.to_s
  # }
  # def response
  #   response = "CON 1. Enter product unit \n 0. Go back"
  # end

  # def handle_input(user_input)
  #   if user_input == '0'
  #     next_screen = Product.to_s
  #   else
  #     next_screen = Unit.to_s
  #   end
  #   next_screen
  # end
end

class ProductMenu < MenuInputScreen
  @next_screen  = 'Unit'
  @menu_options = {
    '0' => Product.to_s
  }
end

# class ProductBackFoward < BackFowardScreen
#   @response = ''
#   @next_screen = 'unknown screen'
#   def handle_input(user_input)
#     if user_input == '0'
#       @next_screen = Product.to_s
#     else
#       @next_screen = 'Unit'
#     end
#     @next_screen
#   end

#   def responed
#     @next_screen.new.response
#   end
# end

class Unit

  def responed
    response = "END Product successfully created \n Thank you"
  end

  def handle_input(user_input)
    'DoneEnd'.to_s
  end

end

class  DoneEnd
  def response
    response = "Thank you"
  end
  def handle_input(user_input)
    
  end
end








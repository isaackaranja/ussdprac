require 'screens/screan.rb'
# require_relative 'screens/screan.rb'

class UssdController < ActionController::API

  def ussd_point
    session_id    = params.dig("sessionId")
    service_code  = params.dig("serviceCode")
    text          = params.dig("text")
    phone_number  = params.dig("phoneNumber")
    my_session    = Session.find_or_create_by(sessionId: session_id)

    initial_screen = false
    if !my_session.next.nil?
      screen          = my_session.next
    else
      screen          = "EnterName"
      initial_screen = true
    end
    text = text.split('*')                  
    next_screen     = screen.constantize.new.handle_input(text.last)  if ! initial_screen
    next_screen = screen if initial_screen
    response        = next_screen.constantize.new.responed
    my_session.next = next_screen
    my_session.save
    render plain: response          

    


  #   response = ""
  #   product  = {}
  #   input    = text.split('*')[-1]                if !text.blank?
  #   puts "text is: ", text
  #   loop do

  #     if text == ""
  #       my_session.previous  = 'start'
  #       my_session.now       = "username"
  #       my_session.next      = 'age'
  #       my_session.responses  = text.split("*")
  #       my_session.save
  #       response = "CON Create an Account\n" + " Enter User Name \n"
  #       break
  #     elsif (text.class == String && text.length > 2 && my_session.next == 'age')
  #       response = "CON Age \n" + "Enter Age \n"
  #       my_session.previous = 'age'
  #       my_session.next     = 'product_name'
  #       my_session.responses  = text.split("*")
  #       my_session.save
  #       break
  #     elsif (my_session.previous == 'age' && my_session.next == 'product_name') || (my_session.previous == 'product_unit' && my_session.next == 'product_back')
  #       if my_session.previous == 'product_unit' && my_session.next == 'product_back'
          
  #       end
  #       user_details = text.split("*")
  #       username = user_details[0]
  #       age      = user_details[1]
  #       user     = User.create(username: username, age: age)
        
  #       if user.class == User
  #         response = "CON User #{ username } has been registerd \n" + "Register Product"  
  #         my_session.previous = 'product_name'
  #         my_session.next     = 'product_unit'
  #         my_session.responses  = text.split("*")
  #         my_session.save
  #         break
  #       end
  #     elsif my_session.previous == 'product_name' && my_session.next == 'product_unit'
  #       product["name"] = text.split('*')[-1]
  #       response = "CON Enter the unit for #{ product["name"] } \n" + "Enter units\n" + "0. to go back"
  #       my_session.previous   = 'product_unit'
  #       my_session.next       = 'done'
  #       my_session.responses  = text.split("*")
  #       my_session.save
  #       break
  #     elsif  my_session.previous == 'product_unit' && my_session.next == 'done'
  #       responses = JSON.parse(my_session.responses)
  #       responses.delete("0")
  #       input          = (text.split('*') - responses)[0]
  #       if input == '0'
  #         my_session.previous = 'product_name'
  #         my_session.next     = 'product_unit'
  #         my_session.responses  = (text.split("*") & JSON.parse(my_session.responses))[0..-2]
  #         my_session.save
  #         response              = "CON Register Product. Enter product name"
  #       else
  #         response = "End Product #{product["name"]} has been registered "
  #       end
  #       break
  #     else
  #       response = "Something went wrong"
  #       break    
  #     end
  #   # break
  #   end
  #   puts 'params sent are', params
  #   # render json: {text: text}
  #   render plain: response
  end

end
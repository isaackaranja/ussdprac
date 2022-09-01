class BaseScreen
  @response = ""

  class << self
    attr_reader :response
  end

  def responed
    self.class.response
  end
end



class InputScreen < BaseScreen

  @next_screen = 'empty Screen'

  class << self
    attr_reader :response, :next_screen
  end

  def handle_input(user_input)
    self.class.next_screen.to_s
  end

end


class MenuScreen < BaseScreen

  @menu_options = {}

  class << self
    attr_reader :response, :next_screen, :menu_options
  end

  def handle_input(user_input)
    self.class.menu_options[user_input]
  end
end


class EndScreen < BaseScreen

  def responed
    "END #{super}"
  end
end

class MenuInputScreen < MenuScreen

  @next_screen = ""

  class << self
    attr_reader :response, :next_screen, :menu_options
  end

  def handle_input(user_input)
    if not self.class.menu_options.include? user_input
      @next_screen
    else
      super(user_input)
    end  
  end

  # def handle_input(ussd_input)
    # if @menu_options.keys.include? ussd_input
      
    # end
    # if input in menu options handler call menus screen handle input
    # else call input screen hanelde input
  # end
end 

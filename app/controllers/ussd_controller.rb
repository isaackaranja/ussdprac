class UssdController < ActionController::API

  def ussd_point
    puts 'params sent are', params
    render json: {name: "malkia", age: 56}
  end

end
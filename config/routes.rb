Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/ussd_result/',         to: 'ussd#ussd_point'
end

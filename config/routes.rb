Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/ussd_result/',         to: 'ussd#ussd_point'
end

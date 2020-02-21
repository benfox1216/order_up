Rails.application.routes.draw do
  #dishes
  get '/dishes/:dish_id', to: 'dishes#show'
end

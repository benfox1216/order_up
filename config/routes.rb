Rails.application.routes.draw do
  #dishes
  get '/dishes/:dish_id', to: 'dishes#show'
  
  #chefs
  get '/chefs/:chef_id', to: 'chefs#show'
  get '/chefs/:chef_id/ingredients', to: 'chef_ingredients#index'
end

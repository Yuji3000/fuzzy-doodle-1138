Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/mechanics/:id', to: 'mechanics#show'
  post 'mechanics/:id/rides', to: 'mechanic_rides#create'
  resources :mechanics, only: [:show]
end

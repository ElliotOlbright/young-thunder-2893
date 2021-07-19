Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/studios', to: 'studio#index'
  get '/movies/:id/:id', to: 'movie#show'
  get '/studios/:id', to: 'studio#show'
end

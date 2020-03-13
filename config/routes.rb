Rails.application.routes.draw do
  resources :birds
  # get '/birds' => 'birds#index'
  # get '/birds/:id' => 'birds#show'
end
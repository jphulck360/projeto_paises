Rails.application.routes.draw do
  resources :countries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #root to: 'countries#index' # Página inicial
  #get 'countries/sobre'

  #get "/pages/:page" => "pages#sobre"
  get "/pages/:page" => "pages#show"
  #root to: 'countries#index' # Página inicial
  root "pages#show", page: "sobre"
end

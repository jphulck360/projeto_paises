Rails.application.routes.draw do
  resources :countries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'countries#index' # Página inicial
  get 'countries/sobre'
end

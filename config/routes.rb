Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'

  resources :employees, only: :index
  resources :check_in_reasons, only: :index
  resources :check_out_reasons, only: :index
  resources :check_in_check_out_reasons, only: :index

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

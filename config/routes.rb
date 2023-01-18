Rails.application.routes.draw do
  get 'login/index' => 'login#index', as: :login
  get 'login/logout' => 'login#logout', as: :logout
  post 'login/auth' => 'login#auth', as: :auth
  
  get 'home/index'
  get 'home/transactions/:account_id' => 'home#transactions', as: :transactions

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end

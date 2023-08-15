Rails.application.routes.draw do
  devise_for :users
  get 'pages/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'pages/:main_id' => "pages#connect"
  # Defines the root path route ("/")
  root "pages#index"
end

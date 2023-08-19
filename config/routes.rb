Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  post '/room' => 'room#create', as: :rooms
  post '/message' => 'room#create_message', as: :messages
  get '/:room_id' => "pages#index", as: :room_show
  root "pages#index"
end

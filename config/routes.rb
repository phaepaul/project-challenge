Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :dogs
  post 'likes' => 'likes#create'
  delete 'likes' => 'likes#destroy'
  root to: "dogs#index"
end

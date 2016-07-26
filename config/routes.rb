Rails.application.routes.draw do
  resources :articles
  devise_for :users
  resources :messages do 
  	resources :comments
  	
  	
  end
  root 'messages#index'
end

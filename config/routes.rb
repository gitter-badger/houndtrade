Rails.application.routes.draw do
  get 'static_pages/about'

  get 'static_pages/contact'

  resources :articles
  devise_for :users
  resources :messages do 
  	resources :comments
  	
  	
  end
  root 'messages#index'
end

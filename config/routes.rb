Alexis::Application.routes.draw do
  
  root :to => 'home#index'
  
  resources :users
    match 'signup' => 'users#new'
    
  resources :user_sessions
    match 'login' => 'user_sessions#new', :as => :login
    match 'logout' => 'user_sessions#destroy', :as => :logout
    
  resources :business_cards do
    
    member do
      post :select_theme
    end
    
  end
  
  resources :profiles, :only => [:show, :edit, :update]
    
  match '/dashboard' => 'dashboard#index'
  
  match '/:url' => 'business_cards#show'
  
end

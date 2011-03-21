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
      post :set_background_color
      post :order_contact_info
      get :stats
      get :delete
    end
    
    resources :business_card_section_orders do
      collection do
        post :update
      end
    end
    
  end
  
  
  
  resources :profiles, :only => [:show, :edit, :update]
  
  namespace :backbone do
    resources :business_cards
    resources :themes, :only => [:index]
    resources :backgrounds: :only => [:index]
  end
  
  match '/stage' => 'stage#index'
    
  match '/dashboard' => 'dashboard#index'
  
  match '/:url' => 'business_cards#show'
  
end

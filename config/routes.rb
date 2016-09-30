Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users,
              :path => '',
              :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'}         

  resources :users, only: [:show]

  resources :photos

  resources :rooms do
    resources :reservations, only: [:create]
  end

  get '/cart' => "cart#index"
  get '/preload' => "reservations#preload"

  resources :posts do
		resources :comments
  	member do 
  		post :help
      post :cancel
  	end
  end

  resources :rooms

  resources :orders

  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
    resources :posts
  end

  namespace :admin do
  	resources :posts
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root :to => "welcome#index"
  #root :to => "posts#index"
  
end

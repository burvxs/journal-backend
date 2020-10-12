Rails.application.routes.draw do
  get 'pages/index'
  root :to => 'pages#index'
  scope '/auth' do 
    resources :tasks 
    resources :categories
    resources :sub_lists
    resources :trackers
    resources :reviews
    get '/user_sub_list' => 'categories#user_sub_lists'
    post 'user_token' => 'user_token#create'
    post '/login' => 'user_token#create'
    post '/signup' => 'users#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

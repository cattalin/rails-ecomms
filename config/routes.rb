Rails.application.routes.draw do
  get 'categories/show'

  get 'categories/index'

  resources :products, :categories
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :opinions
  #get "/opinions/:id", to: "opinions#show"
  
  get 'users/index'
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  
  root "welcome#index"
end


#devise_for :users, controllers: { sessions: 'user/sessions' }
#devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

#get '/user/sign_up', to: 'user/registrations#new'


# get "log_out" => "session#destroy", :as => "log_out"
# get "log_in" => "session#new", :as => "log_in"
# get "sign_up" => "users#new", :as => "sign_up"
# root :to => "users#new"
# resources :users

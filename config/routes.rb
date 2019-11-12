Rails.application.routes.draw do
  
  root 'static_pages#home'
  
  get '/projects', to: 'static_pages#projects'
  
  resources :blog_posts
  
  get '/admin_login', to: 'sessions#new'
  post '/admin_login', to: 'sessions#create'
  delete '/admin_logout', to: 'sessions#destroy'
end

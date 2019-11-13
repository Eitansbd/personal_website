Rails.application.routes.draw do
  
  root 'static_pages#home'
  
  get '/projects', to: 'static_pages#projects'
  get 'blog_posts/unpublished', to: 'blog_posts#unpublished'
  
  resources :blog_posts do
    patch :toggle_published, to: 'blog_posts#toggle', as: 'toggle_published'
  end
  
  
  get '/admin_login', to: 'sessions#new'
  post '/admin_login', to: 'sessions#create'
  delete '/admin_logout', to: 'sessions#destroy'
end

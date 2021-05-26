Rails.application.routes.draw do
  resources :tags
  resources :profiles
  resources :posts
  resources :post_tags
  resources :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

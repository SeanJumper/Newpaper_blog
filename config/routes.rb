Rails.application.routes.draw do
  get 'content/world'
  get 'content/politics'
  get 'content/sport'
  get 'content/design'
  get 'content/culture'
  get 'content/business'
  get 'content/travel'
  get 'content/science'
  get 'content/Opinion'
  get 'content/technology'
  get 'content/health'
  devise_for :users
  get 'welcome/index'
  resources :posts

  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

require 'sidekiq/web'
require 'sidekiq-scheduler/web'


Rails.application.routes.draw do

  devise_for :users
  get 'home/index'

  root to: "home#index"

  resources :dogs, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'

end

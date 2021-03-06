require 'sidekiq/web'
require 'sidekiq-scheduler/web'


Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :dogs, only: [:index, :vote] do
    post '/vote' => 'votes#vote', as: :vote
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'

  root "home#index"

end

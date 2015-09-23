Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  devise_scope :user do
    put 'change_plan', :to => 'registrations#change_plan'
  end
  resources :users
  ActiveAdmin.routes(self)
  get "content/silver"
  get "content/gold"
  get "content/platinum"
  mount Payola::Engine => '/payola', as: :payola
  root to: 'visitors#index'
  get 'visitors/pricing'
  get 'products/:id', to: 'products#show', :as => :products
end

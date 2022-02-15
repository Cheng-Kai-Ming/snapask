require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users
  resources :courses
  mount ApiRoot => ApiRoot::PREFIX
  authenticate :user, ->(u) { Ability.new(u).can? :manage, :admin } do
    mount Sidekiq::Web => 'admin/sidekiq'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/view/courses', to: "courses#user"
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

  devise_for :users

  scope module: 'admin', as: 'admin' do
    resources :products
  end
end

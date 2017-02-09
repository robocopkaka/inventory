Rails.application.routes.draw do
  devise_for :users
  get 'products/index'

  get 'products/new'

  get 'products/edit'

  get 'products/update'

  get 'products/delete'

  root to: 'products#index'

  resources :products, except: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

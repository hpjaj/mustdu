Rails.application.routes.draw do
  
  devise_for :users
  resources :mustdos, only: [:new, :create, :show, :index, :destroy]
  
  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

end

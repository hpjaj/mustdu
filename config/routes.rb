Rails.application.routes.draw do
  
  devise_for :users
  resources :mustdos, only: [:new, :create, :show, :index]
  
  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

end

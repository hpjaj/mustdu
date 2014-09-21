Rails.application.routes.draw do
  
  resources :mustdos, only: [:new, :create, :show]
  
  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

end

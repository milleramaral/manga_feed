Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :mangas, only: [:index, :show]

  namespace :api, defaults: { format: :json} do
    resources :notifications, only: [:index]
    resources :mangas, only: [:index, :show]
  end  

end

Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :mangas, only: [:index, :show]

  get "/feed", to: "welcome#index"
end

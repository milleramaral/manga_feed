Rails.application.routes.draw do
  root to: 'welcome#index'

  get "/feed", to: "welcome#index"
end

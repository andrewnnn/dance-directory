Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root "studios#home"

  get "/search", to: "studios#search"

  resources :studios do
    resources :reviews
  end
end

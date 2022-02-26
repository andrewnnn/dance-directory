Rails.application.routes.draw do
  root "studios#index"

  resources :studios
end

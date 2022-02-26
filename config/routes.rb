Rails.application.routes.draw do
  root "studios#home"

  get "/results", to: "studios#results"

  resources :studios
end

Rails.application.routes.draw do
  root "application#index"
  resources :to_do_items
end

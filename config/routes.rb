Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "swagger"
  root "application#index"
  resources :to_do_items
end

Rails.application.routes.draw do
  namespace :admin do
    resources :idols
  end
  namespace :admin do
    resources :blogs
  end
  namespace :admin do
    resources :dashboards, only: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

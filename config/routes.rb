require 'sidekiq/web'

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :sidebar, only: :index
      resources :idols, only: %w[show index]
      resources :blogs, only: %w[show index]
      resources :inquiries, only: :create
    end
  end

  namespace :admin do
    resources :idols
    resources :blogs
    resources :dashboards, only: :index
    mount Sidekiq::Web => "/sidekiq"
  end
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

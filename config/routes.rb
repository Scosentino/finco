Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :user_stocks
  resources :stocks, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'
  get '/show', to: 'stocks#show', as: :stock

  get '/stock-list', to: 'user_stocks#stock_list'
  get '/market-update', to: 'stocks#market_update'



  devise_scope :user do
    authenticated :user do
      root 'user_stocks#index', as: :authenticated_user
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end

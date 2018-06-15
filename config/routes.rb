Rails.application.routes.draw do
  devise_for :users
  resources :user_stocks

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    authenticated :user do
      root 'staticpages#home', as: :authenticated_user
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end




  get '/about' => 'staticpages#about'
  get '/' => 'staticpages#home', as: :dashboard
  post '/' => 'staticpages#home'

end

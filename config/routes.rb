Rails.application.routes.draw do
  resources :companies
  devise_for :users
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  scope '/admin' do
    resources :users, :controller => 'users'
  end

  root 'home#index'
  get '/about', to: 'home#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

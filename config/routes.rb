Rails.application.routes.draw do

  
    mount RailsAdmin::Engine => '/command_center/super_admin', as: 'rails_admin'

  get 'home/index'
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'member#index'
    end
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get 'admin/form' => 'admin#new'
  post 'admin/form' => 'admin#create'

  
  

end

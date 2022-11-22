Rails.application.routes.draw do
  get 'uploader/index'
  get 'uploader/form'
  get 'uploader/upload'
  get 'uploader/download'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :users, only: :show
  resources :articles
end

Rails.application.routes.draw do
	devise_for :users
  resources :users, only: [:show, :index, :edit, :update]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  end
 	resource :book_comments, only: [:create, :destroy]
  root 'home#top'
  get 'home/about' => 'home#about'
end
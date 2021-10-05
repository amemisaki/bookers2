Rails.application.routes.draw do
  devise_for :users
  root to: "home#login"
  get 'home/about' => "home#about" 
  resources :users, only:[:index, :show, :edit, :update]
  resources :books, only:[:show, :create, :edit, :update, :destroy]
  get 'books' => "books#books" #Books_TOP
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

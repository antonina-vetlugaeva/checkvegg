Rails.application.routes.draw do
  resources :brands
  get 'welcome/index'
  get 'static/about', :as => 'about_page'
  resources :favourite_items
  resources :favourites
  resources :users
  resources :product_items
  resources :ingridients
  resources :types
  resources :categories
  resources :products

  resources :categories do
    resources :products
  end

  resources :brands do
    resources :products
  end

  resources :products, only: [:index, :new, :create]
  #будет сгенерирован один маршрут на все экшны


  get "/:page" => "static#show"
end

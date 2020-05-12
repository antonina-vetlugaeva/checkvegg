Rails.application.routes.draw do
  get 'welcome/index'
  get 'static/about', :as => 'about_page'
  resources :product_items
  resources :ingridients
  resources :types
  resources :categories
  resources :products
  resources :brands

  resources :categories do
    resources :products
  end

  resources :brands do
    resources :products
  end

  resources :products, only: [:index, :new, :create, :update]

  get "/:page" => "static#show"
end

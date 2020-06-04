Rails.application.routes.draw do
  resources :add_quantity_to_line_items
  resources :line_items
  resources :carts
	root 'store#index', as: 'store_index'
  get 'store/index'
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'checkout/start'

  get 'checkout/receipt'

  get 'carts/view'

  get 'sign_in' => 'session#new', as: :sign_in
  post 'sign_in' => 'session#create'
  get 'sign_out' => 'session#delete', as: :sign_out

  get 'sign_up' => 'user#new', as: :new_user
  post 'sign_up' => 'user#create', as: :users

  root 'books#index'
  resources :books

  resources :authors

  namespace :api do
    resources :books
    resources :authors
  end

  get 'cart' => 'carts#view', as: :cart
  post 'cart' => 'carts#add_to_cart', as: :add_to_cart
  delete 'cart' => 'carts#remove_from_cart', as: :remove_from_cart
  post 'checkout' => 'carts#process_payment', as: :process_payment
  get 'receipt/:id' => 'carts#receipt', as: :receipt

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

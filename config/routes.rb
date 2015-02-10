Rails.application.routes.draw do
  get 'users/index'

  get 'users/new'

  get 'products/title'
get 'products/show'
  get 'products/new'
  get 'products/trans'
  put 'products/trans_pay'
  get 'authors/index'
  put 'products/save_image'
  get 'products/add_image'
  get 'auth/:provider/callback', to: 'users#facebook_login'
get 'logout', to: 'users#destroy_session'
match "products/:id/:product_name" => "products#seo_url", :as => "product_article",  :id => /\d+/, via: :get
  get 'authors/new'
  get 'authors/home'
  get 'authors/edit'
  get 'authors/show'
  get 'images/new'
  get 'images/index'
  get 'users/let_me_login'
  get 'users/allow_login'
  get 'users/destroy_session'
get 'purchase' => 'products#index', as: :purchase 
  resources :authors
  resources :images
  resources :products
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'users#let_me_login'

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

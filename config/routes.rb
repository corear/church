Rails.application.routes.draw do
  resources :relationships, only: [:create, :destroy]
  
  devise_scope :user do
    get "/signin" => "devise/sessions#new" # custom path to login/sign_in
    get "/register" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
    get '/secure/password_update' => "devise/passwords#edit"
  end
  
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  # Define Root URL
  root 'pages#index'
  resources :posts do
    member do
      put 'like', to: 'posts#upvote'
    end
    resources :comments
  end
  
  # This defines the routes for the pages
  get '/home' => 'pages#home'

  get '/@:id' => 'pages#profile'
  
  get '/@:id/:type' => 'pages#list'

  get '/groups' => 'pages#groups'

  get '/all_posts' => 'pages#posts'
  
  get '/post/:id' => 'pages#postpage'
  
  get '/search/:id1/:id' => 'pages#search_handler'
  
  
  get :send_custom, to: 'pages#send_custom', as: :send_custom
  

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

StaticTest::Application.routes.draw do

  resources :inboxes

  resources :notifications

  resources :events

  get "events/new"

  resources :users do
    member do
      get :following, :followers, :info
    end
  end
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  resources :comments, :only => [:create, :destroy]
  
  resources :colleges do
    get :autocomplete_college_name,  :on => :collection
    get :auto_fetch_departments, :on => :collection
  end
  
  resources :departments do
     get :auto_fetch_groups, :on => :collection
  end
  resources :groups
  resources :user_colleges, :only => [:create]
  
  root :to => 'static_pages#home'
  match '/channel.html', :to => 'static_pages#channel'
  match '/fblogin', :to => 'static_pages#fblogin'
  match '/fbredirect', :to => 'static_pages#fb_redirect'
  match '/fb_token', :to => 'static_pages#fb_token'
  match '/help',    :to => 'static_pages#help'
  match '/about',   :to => 'static_pages#about'
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy', :via => :delete
  match '/newdept', :to => 'departments#new'
  match '/newgroup', :to => 'groups#new'
  match '/fb_login', :to => 'fb#login'
  match '/fb_redirect', :to => 'fb#redirect'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

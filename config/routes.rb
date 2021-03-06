StaticTest::Application.routes.draw do

  resources :password_resets

  resources :users do
    member do
      get :following, :followers, :info, :notifications, :events, :approve, :autocomplete_user_name
    end
    resources :microposts

  end
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]
  resources :comments, :only => [:create, :destroy]

  resources :ajax do
      get :users, :on => :collection
  end

  resources :relationships do
    member do
      post :user_unfollow , :user_follow
    end
  end

  resources :colleges do
    #college/1/microposts
    resources :microposts

    #college/1/departments
    resources :departments do
      #college/1/departments/1/microposts
      resources :microposts
      #college/1/departments/1/groups
      resources :groups do
        #college/1/departments/1/groups/1/microposts
        resources :microposts
      end
    end
    resources :groups do
      resources :microposts
    end
    get :autocomplete_college_name,  :on => :collection
    get :auto_fetch_departments, :on => :collection
  end
  #College ends here
  
  resources :departments do
    resources :groups do
      resources :microposts
    end
    resources :microposts
    get :auto_fetch_groups, :on => :collection
  end

  resources :groups do
    resources :microposts
  end

  resources :user_colleges do
    member do
      put :approveme
    end
  end


  resources :inboxes, :only => [:new, :create, :destroy]
  resources :notifications, :only => [:new, :create, :destroy]
  resources :events, :only => [:new, :create, :destroy]

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
  match '/fb_login', :to => 'fb#login'
  match '/fb_redirect', :to => 'fb#redirect'
  match '/notifications_check', :to => 'users#notifications_check'
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

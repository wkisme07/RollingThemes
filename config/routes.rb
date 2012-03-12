Rollingthemes::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  match '/administrator' => 'Administrator::Application#index', :as => 'administrator_root'
  match '/administrator/destroy_selection' => 'Administrator::Application#destroy_selection', :as => :administrator_destroy_selection
  match '/administrator/posts/:post_id/comments/:id/approve' => 'Administrator::Comments#approve', :as => :administrator_approve_comment

  namespace :administrator do
    resources :categories
    resources :tags
    resources :authors
    resources :posts do
      collection do
        get :publish
      end

      resources :comments do
        collection do
          get :approve
        end
      end
      resources :post_versions
    end
    resources :users do
      collection do
        get    :account_setting
        put    :update_account
      end
    end
  end

  # FRONT-END ROUTES #
  match "/posts/detail/:id" => 'Home#show', :as => :post_detail
  match "/authors/:id" => 'Home#author', :as => :author_page
  match "/posts/:id/comments" => 'Home#send_comment', :as => :send_comment
  match "/posts/remove_comment/:id" => 'Home#remove_comment', :as => :remove_comment

  resources :home, :only => [:index, :show] do
    collection do
      get :author
      post :send_comment
      delete :remove_comment
    end
  end


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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

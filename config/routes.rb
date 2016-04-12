Rails.application.routes.draw do
  
  get '/:locale' => 'static_pages#home'
  
  scope "/:locale", locale: /en|ru|kz/ do
    root to: redirect("/%{locale}")
    
    
    
    get 'password_resets/new'
    get 'password_resets/edit'

    get 'sessions/new'

    get 'home'    => 'static_pages#home'
    get 'help'    => 'static_pages#help'
    get 'about'   => 'static_pages#about'
    get 'biography' => 'static_pages#biography'
    get 'contact' => 'static_pages#contact'
    
    # get 'signup'  => 'users#new'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    
    resources :users,               only: [:index, :show, :edit, :update, :destroy]
    resources :password_resets,     only: [:new, :create, :edit, :update]
    resources :presses do
      collection do
          get :add_simple_images
      end
    end
    resources :novas do
      collection do
          get :add_simple_images
      end
    end
    resources :albums do
      collection do
          get :add_simple_images
      end
    end
    resources :carousels
    resources :static_fields,     only: [:new, :create]
  end
  
  root to: redirect("/#{I18n.default_locale}"), as: :redirected_root
  
  
  
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

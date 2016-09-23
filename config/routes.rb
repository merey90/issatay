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
end

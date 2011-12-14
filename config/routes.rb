Zoo::Application.routes.draw do
  get "purchases/index"

  get "sales/index"

  resources :owners, :only=> [:create, :destroy]
  match "purchases", :to => "purchases#index"
  match "sales", :to => "sales#index"

  resources :relationships
  resources :animals
  devise_for :users   
  resources :users
  resources :owners, :only => [:create, :destroy]


  root :to => "pages#home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

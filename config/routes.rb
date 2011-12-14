Zoo::Application.routes.draw do
  get "owners/create"

  get "owners/destroy"

  resources :relationships
  resources :animals
  devise_for :users   
  resources :users
  resources :owners, :only => [:create, :destroy]
  get "/buy/:id", :to => "sales#buy"
  get "/sell/:id", :to => "sales#sell"

  root :to => "pages#home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

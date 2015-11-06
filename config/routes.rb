Rails.application.routes.draw do
  
  devise_for :logins, 
                     controllers: {omniauth_callbacks: 'logins/omniauth_callbacks',
                             registrations: 'registrations',
                             sessions: 'sessions'}

  devise_scope :login do
    get 'logins/logout' => 'devise/sessions#destroy'
  end


  resources :confirmados
  #get 'home/index'
  root 'eventos#index'

  post 'login_request', controller: 'login_requests', action: 'create'

  get 'show_requests', controller: 'login_requests', action: 'show_requests'  


  #devise_for :logins, controllers: { registrations: "registrations"}
  resources :locals
  resources :cidades
  resources :estados
  resources :usuarios
  resources :eventos

  #root :to => redirect('/eventos?')

  #devise_for :logins, :controllers => { :omniauth_callbacks => "logins/omniauth_callbacks", 
  #  registrations: 'registrations', sessions: 'sessions'}   



  #devise_for :logins, 
  #                   controllers: {:omniauth_callbacks => 'login/omniauth_callbacks',
  #                           registrations: 'registrations',
  #                           sessions: 'sessions'}

    #devise_for :logins, path_names: {sign_in: 'login', sign_out: 'logout'},
    #                 controllers: {:omniauth_callbacks => 'logins/omniauth_callbacks',
    #                         registrations: 'registrations'}

  #get "/auth/:provider/callback" => "registrations#create", as: :auth_callback
  #get "/auth/failure" => "registrations#failure", as: :auth_failure
  #get "/logout" => "registrations#destroy", as: :logout

#end
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

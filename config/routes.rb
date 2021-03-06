Rails.application.routes.draw do
  root 'static_pages#home'

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  get 'donate', to: 'donations#new', as: :donations_new
  post 'donate', to: 'donations#create', as: :donations_create

  get 'receive', to: 'recipients#new', as: :recipients_new
  post 'receive', to: 'recipients#create', as: :recipients_create

  scope '/coordinator' do
    get '/deliver', to: 'coordinator#deliver', as: :coordinator_deliver
    post '/deliver', to: 'coordinator#confirm', as: :coordinator_confirm
    get '/schedule', to: 'coordinator#schedule', as: :coordinator_schedule
    post '/schedule', to: 'coordinator#match', as: :coordinator_match
    get '/data', to: 'coordinator#data', as: :coordinator_data
  end

  scope '/donor' do
    get '/profile', to: 'donor#profile', as: :donor_profile
    put '/profile', to: 'donor#change_profile', as: :donor_profile_change
    patch '/profile', to: 'donor#upload_logo', as: :donor_profile_logo
  end

  scope '/recipient' do
    get '/profile', to: 'recipient_profiles#show', as: :recipient_profile
    put '/profile', to: 'recipient_profiles#change_profile', as: :recipient_profile_change
  end

  scope '/donation' do
    get '/cancel', to: 'donations#cancel', as: :donations_cancel
    get '/cancel_interest', to: 'recipient_profiles#cancel_interest', as: :interes_cancel
    get '/cancel_match', to: 'recipient_profiles#cancel_match', as: :match_cancel
  end

  get 'interest/create/:authentication/:recipient_id/:donation_id', to: 'create_interest#create'

  devise_for :users, :controllers => { sessions: 'sessions', registrations: 'registrations' }
  get '/users/exists', to: 'users#check_user', as: :user_exists
  put '/users/:id', to: 'users#update'

  get "unsubscribe" => "api#unsubscribe"

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
  # resources :users

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

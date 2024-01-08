Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :kinds
  scope module: 'v1' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == "1" } do
      resource :kind, only: [ :show ]
      resource :kind, only: [ :show ], path: 'relationships/kind'
      resource :phones, only: [ :show ]
      resource :phones, only: [ :show ], path: 'relationships/phones'
      resource :phone, only: %i[ update create destroy ]
      resource :phone, only: %i[ update create destroy ], path: 'relationships/phone'
      resource :address, only: %i[ show update create destroy ]
      resource :address, only: %i[ show update create destroy ], path: 'relationships/address'
    end
  end
  scope module: 'v2' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == "2" } do
      resource :kind, only: [ :show ]
      resource :kind, only: [ :show ], path: 'relationships/kind'
      resource :phones, only: [ :show ]
      resource :phones, only: [ :show ], path: 'relationships/phones'
      resource :phone, only: %i[ update create destroy ]
      resource :phone, only: %i[ update create destroy ], path: 'relationships/phone'
      resource :address, only: %i[ show update create destroy ]
      resource :address, only: %i[ show update create destroy ], path: 'relationships/address'
    end
  end
end

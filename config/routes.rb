Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
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

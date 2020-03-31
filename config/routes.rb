Rails.application.routes.draw do
  devise_for :users

  resources :religions do
    resources :categories do
      resources :subcategories do
        resources :products
      end
    end
  end

  resources :accessories

  resources :colors

  root 'religions#index'

  get 'api/religions', to: 'api#religions', defaults: {format: :json}
  get 'api/colors', to: 'api#colors', defaults: {format: :json}
  get 'api/accessories', to: 'api#accessories', defaults: {format: :json}

  post 'submision/create'
  get 'submision/new'

  resources :tests
end

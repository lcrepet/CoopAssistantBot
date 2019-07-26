Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, only: :create do
    collection do
      get 'redirect', to: 'messages#redirect'
    end
  end

  get 'auth', to: 'auth#login'
end

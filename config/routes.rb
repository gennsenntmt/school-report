Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'reports#index'
  get 'users/:id' => 'users#show'
  get 'search', to: 'reports#search'
  
  
  resources :users do 
    resources :reports, only: [:new,:create] 
  end

  resources :students , only: [:show,:new,:create,:edit,:update,:destroy]
  resources :reports

end
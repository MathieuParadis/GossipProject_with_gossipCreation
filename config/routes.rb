Rails.application.routes.draw do
  root to: 'home#index'
  get 'contact', to: 'static_pages#contact'
  get 'team', to: 'static_pages#team'
  get 'welcome/:user_entry', to: 'welcome#show'
  get 'user/:user_first_name/:last_name', to: 'user#show', as: 'user'
  # get 'gossips/:gossip_id', to: 'gossips#show', as: 'gossip'
  resources :gossips

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

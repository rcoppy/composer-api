Rails.application.routes.draw do
  resources :tags
  resources :genres
  resources :application_comments
  resources :score_comments
  resources :scores
  resources :decisions
  resources :applications
  resources :ratings
  devise_for :users,
            controllers: {
              sessions: 'sessions',
              registrations: 'registrations'
            }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

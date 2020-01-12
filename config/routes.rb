Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :tags
      resources :genres
      resources :application_comments
      resources :score_comments
      resources :scores
      resources :decisions
      resources :apps
      resources :ratings
      resources :users

      scope 'scores', as: 'scores' do
        get ':id/genres', :to => 'scores#show_genres'
        get ':id/tags', :to => 'scores#show_tags'

        post ':id/genres', :to => 'scores#add_genre'
        post ':id/tags', :to => 'scores#add_tag'
      end
    end
  end

  devise_for :users,
            controllers: {
              sessions: 'sessions',
              registrations: 'registrations'
            }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      defaults format: :json do
        devise_for :users,
                   singular: 'user',
                   controllers: {
                     sessions: 'api/v1/sessions',
                     registrations: 'api/v1/registrations'
                   }

        resources :users, only: %i[show index]
      end
    end
  end
end

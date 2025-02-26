Rails.application.routes.draw do
  defaults format: :json do
    namespace :api do
      namespace :v1 do
        devise_for :users,
                   controllers: {
                     sessions: 'api/v1/sessions',
                     registrations: 'api/v1/registrations',
                     passwords: 'api/v1/passwords'
                   },
                   path: '',
                   path_names: { sign_in: 'login', sign_out: 'logout' }

        resources :users, only: %i[show index]
      end
    end
  end
end

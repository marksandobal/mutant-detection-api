Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    scope module: :v1, constraints: ApiVersionConstraint.new(version: 1) do
      resources :sessions, only: [:create]
      resources :stats, only: [:index]
      resources :users, only: %i[index show create]

      post 'mutant', to: 'mutants#create'
    end
  end
end

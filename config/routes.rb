Rails.application.routes.draw do
  # resources :mutans, only: %i[index, create]
  resources :stats, only: %i[index]

  post 'mutant', to: 'mutants#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

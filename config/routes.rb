Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "countries#index"
  get '/countries', to: "countries#index"
  get '/countries/:id', to: "countries#show"
  get '/citizens', to: "citizens#index"
  get '/citizens/:id', to: "citizens#show"
  get '/countries/:id/citizens', to: "country_citizens#index" #????
end

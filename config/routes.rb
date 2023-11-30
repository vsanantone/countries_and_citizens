Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "countries#index"
  get '/countries', to: "countries#index"
  get '/countries/new', to: "countries#new"
  get '/countries/:id', to: "countries#show"
  get '/countries/:id/edit', to: "countries#edit"
  patch '/countries/:id', to: "countries#update"
  get '/citizens', to: "citizens#index"
  get '/citizens/:id', to: "citizens#show"
  get '/countries/:id/citizens', to: "country_citizens#index" #????
  get '/countries/:id/citizens/new', to: "country_citizens#new"
  post '/countries', to: "countries#create"
  post '/countries/:id/citizens', to: "country_citizens#create"
end

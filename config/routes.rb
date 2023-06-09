Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  get "dashboard", to: "users#show"
  get "shopping_list", to: "shopping_list#show"
  get "/auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: "sessions#log_out"
  get "/about", to: "about#index"

  get "/preferences", to: "users#edit"
  patch "/preferences", to: "users#update"

  get "/meals/new_breakfast", to: "recipes#new_breakfast"
  get "meals/new_main", to: "recipes#new_main"
  get "/meals/:id", to: "recipes#show"

  get "/create_meal_plan", to: "day_plans#new"
  post "/create_meal_plan", to: "day_plans#create"

  get "/meal_plan/:id", to: "day_plans#show"
end

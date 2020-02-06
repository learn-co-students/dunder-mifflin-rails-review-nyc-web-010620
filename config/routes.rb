Rails.application.routes.draw do
  resources :dogs
  resources :employees

  post "/dogs/:id/sort", to: "dogs#sort_it"
  get "/dogs/:id/sort", to: "dogs#sort_it", as: "sort"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

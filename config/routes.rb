  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get("/authors",   to: "authors#index")
  get("/authors/:id",   to: "authors#show")
  get("/books",   to: "books#index")
  get("/books/:id",   to: "books#show")
end

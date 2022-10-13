  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get("/authors",   to: "authors#index")
  get("/authors/new",   to: "authors#new")
  post("/authors",   to: "authors#create")
  get("/authors/:id",   to: "authors#show")
  get("/authors/:id/books",   to: "authors_books#index")
  get("/authors/:id/edit",   to: "authors#edit")
  patch("/authors/:id",   to: "authors#update")
  get("/books",   to: "books#index")
  get("/books/:id",   to: "books#show")
end

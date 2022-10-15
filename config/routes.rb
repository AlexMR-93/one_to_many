  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get("/authors",   to: "authors#index")
  get("/authors/new",   to: "authors#new")
  post("/authors",   to: "authors#create")
  get("/authors/:id",   to: "authors#show")
  patch("/authors/:id",   to: "authors#update")
  get("/authors/:id/books/new",   to: "authors_books#new")
  get("/authors/:id/books",   to: "authors_books#index")
  post("/authors/:id/books",   to: "authors_books#create")
  get("/authors/:id/edit",   to: "authors#edit")
  get("/books",   to: "books#index")
  get("/books/:id",   to: "books#show")
  get("books/:id/edit",   to: "books#edit")
  patch("/books/:id",   to: "books#update")
end

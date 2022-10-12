require "rails_helper"


RSpec.describe("Books index") do
  before(:each) do
    @author1 = Author.create!(    name: " Alex",     has_won_awards: false,     books_written: 1)
    @book1 = @author1.books.create!(    title: "Spiderwick",     best_seller: true,     pages: 120)
    @author2 = Author.create!(    name: " Peyton",     has_won_awards: true,     books_written: 2)
    @book2 = @author2.books.create!(    title: "Harry Potter",     best_seller: true,     pages: 140)
    @author3 = Author.create!(    name: " Gabe",     has_won_awards: false,     books_written: 3)
    @book3 = @author3.books.create!(    title: "The Series of Unfortunate events",     best_seller: true,     pages: 100)
  end

  it("#3.Child in the system including the Child's attributes") do
    visit("/books")
    expect(page).to(have_content("Book title:#{@book1.title}"))
    expect(page).to(have_content("Best seller?#{@book1.best_seller}"))
    expect(page).to(have_content("Book length is #{@book1.pages} pages"))
  end

  describe("When I visit any page on the site") do
    it("#8.Then I see a link at the top of the page that takes me to the Parent Index") do
      visit("/books")
      expect(page).to(have_link("Books"))
    end
  end
end

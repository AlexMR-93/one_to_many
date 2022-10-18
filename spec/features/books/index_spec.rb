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

  describe("Next to every child, I see a link to edit that parent's info") do
    describe("When I click the link") do
      it("#17.I should be taken to that child's edit page where I can update its information just like in User Story 14") do
        visit("/books")
        save_and_open_page
        expect(page).to(have_link("Edit Book:#{@book1.title}"))
        click_link("Edit Book:#{@book1.title}")
        expect(current_path).to(eq("/books/#{@book1.id}/edit"))
      end
    end
  end

  describe("Next to every child, I see a link to delete that child") do
    describe("When I click the link") do
      it("#23.I am returned to the Child Index Page where I no longer see that child") do
        visit("/books")
        expect(page).to(have_link("Delete Book:#{@book1.title}"))
        click_link("Delete Book:#{@book1.title}")
        expect(current_path).to(eq("/books"))
      end
    end
  end
end

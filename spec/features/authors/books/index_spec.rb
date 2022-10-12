require "rails_helper"


RSpec.describe("Authors books index page") do
  before(:each) do
    @author1 = Author.create!(    name: " Alex",     has_won_awards: false,     books_written: 1)
    @book1 = @author1.books.create!(    title: "Spiderwick",     best_seller: true,     pages: 120)
    @book4 = @author1.books.create!(    title: "Wickspider",     best_seller: false,     pages: 300)
    @author2 = Author.create!(    name: " Peyton",     has_won_awards: true,     books_written: 2)
    @book2 = @author2.books.create!(    title: "Harry Potter",     best_seller: true,     pages: 140)
    @author3 = Author.create!(    name: " Gabe",     has_won_awards: false,     books_written: 3)
    @book3 = @author3.books.create!(    title: "The Series of Unfortunate events",     best_seller: true,     pages: 100)
  end

  describe(" '/parents/:parent_id/child_table_name'") do
    it("#5. Child that is associated with that Parent with each Child's attributes") do
      visit("/authors/#{@author1.id}/books")
      expect(page).to(have_content("Book title:#{@book1.title}"))
      expect(page).to(have_content("Best seller?#{@book1.best_seller}"))
      expect(page).to(have_content("Book length is #{@book1.pages} pages"))
      expect(page).to(have_content("Book title:#{@book4.title}"))
      expect(page).to(have_content("Best seller?#{@book4.best_seller}"))
      expect(page).to(have_content("Book length is #{@book4.pages} pages"))
    end
  end
end

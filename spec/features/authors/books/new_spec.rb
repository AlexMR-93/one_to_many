require "rails_helper"


RSpec.describe("Authors books NEW page") do
  before(:each) do
    @author1 = Author.create!(    name: " Alex",     has_won_awards: false,     books_written: 1)
    @book1 = @author1.books.create!(    title: "Spiderwick",     best_seller: true,     pages: 120)
    @book4 = @author1.books.create!(    title: "Wickspider",     best_seller: false,     pages: 300)
    @author2 = Author.create!(    name: " Peyton",     has_won_awards: true,     books_written: 2)
    @book2 = @author2.books.create!(    title: "Harry Potter",     best_seller: true,     pages: 140)
    @author3 = Author.create!(    name: " Gabe",     has_won_awards: false,     books_written: 3)
    @book3 = @author3.books.create!(    title: "The Series of Unfortunate events",     best_seller: true,     pages: 100)
  end

  it("taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child") do
    visit("/authors/#{@author1.id}/books/new")
    fill_in("title",     with: "New Title")

    #choose("true")
    fill_in("pages",     with: 3333)
    click_button("Create Book")
    expect(current_path).to(eq("/authors/#{@author1.id}/books"))
  end
end

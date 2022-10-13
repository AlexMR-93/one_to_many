require "rails_helper"


RSpec.describe("Authors New page") do
  before(:each) do
    @author1 = Author.create!(    name: " Alex",     has_won_awards: false,     books_written: 1)
    @book1 = @author1.books.create!(    title: "Spiderwick",     best_seller: true,     pages: 120)
    @book4 = @author1.books.create!(    title: "Wickspider",     best_seller: false,     pages: 300)
    @author2 = Author.create!(    name: " Peyton",     has_won_awards: true,     books_written: 2)
    @book2 = @author2.books.create!(    title: "Harry Potter",     best_seller: true,     pages: 140)
    @author3 = Author.create!(    name: " Gabe",     has_won_awards: false,     books_written: 3)
    @book3 = @author3.books.create!(    title: "The Series of Unfortunate events",     best_seller: true,     pages: 100)
  end

  it("#11 count.click link ,Then I am taken to '/parents/new' where I  see a form for a new parent record") do
    visit("/authors")
    expect(page).to(have_link("New Parent"))
    click_link("New Parent")
    expect(current_path).to(eq("/authors/new"))
    fill_in("name",     with: "new guys")

    #choose("Has won awards(True)")
    fill_in("books_written",     with: 2)
    click_button("Create Author")
    expect(current_path).to(eq("/authors"))
  end
end

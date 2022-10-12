require "rails_helper"


RSpec.describe("Authors show page") do
  before(:each) do
    @author1 = Author.create!(    name: " Alex",     has_won_awards: false,     books_written: 1)
    @book1 = @author1.books.create!(    title: "Spiderwick",     best_seller: true,     pages: 120)
    @book4 = @author1.books.create!(    title: "Wickspider",     best_seller: false,     pages: 300)
    @author2 = Author.create!(    name: " Peyton",     has_won_awards: true,     books_written: 2)
    @book2 = @author2.books.create!(    title: "Harry Potter",     best_seller: true,     pages: 140)
    @author3 = Author.create!(    name: " Gabe",     has_won_awards: false,     books_written: 3)
    @book3 = @author3.books.create!(    title: "The Series of Unfortunate events",     best_seller: true,     pages: 100)
  end

  it("#2.parent with that id including the parent's attributes") do
    visit("/authors/#{@author1.id}")
    expect(page).to(have_content("Authors name:#{@author1.name}"))
    expect(page).to(have_content("Author has has won awards:#{@author1.has_won_awards}"))
    expect(page).to(have_content("Author books written:#{@author1.books_written}"))
  end

  it("#7.count of the number of children associated with this parent") do
    visit("/authors/#{@author1.id}")
    save_and_open_page
    expect(page).to(have_content("Number of books associated with author:#{@author1.book_count}"))
  end
end

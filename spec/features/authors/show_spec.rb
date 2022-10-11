require "rails_helper"


RSpec.describe("Authors show page") do
  before(:each) do
    @author1 = Author.create!(    name: " Alex",     has_won_awards: false,     books_written: 1)
    @author2 = Author.create!(    name: " Peyton",     has_won_awards: true,     books_written: 2)
    @author3 = Author.create!(    name: " Gabe",     has_won_awards: false,     books_written: 3)
  end

  it("#2.parent with that id including the parent's attributes") do
    visit("/authors/#{@author1.id}")
    save_and_open_page
    expect(page).to(have_content("Authors name:#{@author1.name}"))
    expect(page).to(have_content("Author has has won awards:#{@author1.has_won_awards}"))
    expect(page).to(have_content("Author books written:#{@author1.books_written}"))
  end
end

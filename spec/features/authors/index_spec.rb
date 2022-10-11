require "rails_helper"


RSpec.describe("Authors index") do
  before(:each) do
    @author1 = Author.create!(    name: " Alex",     has_won_awards: false,     books_written: 1)
    @author2 = Author.create!(    name: " Peyton",     has_won_awards: true,     books_written: 2)
    @author3 = Author.create!(    name: " Gabe",     has_won_awards: false,     books_written: 3)
  end

  it(" #1.name of each author record in system") do
    visit("/authors")
    save_and_open_page
    expect(page).to(have_content("Authors name:#{@author1.name}"))
    expect(page).to(have_content("Authors name:#{@author2.name}"))
    expect(page).to(have_content("Authors name:#{@author3.name}"))
  end
end

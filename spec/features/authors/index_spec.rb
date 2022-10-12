require "rails_helper"


RSpec.describe("Authors index") do
  before(:each) do
    @author1 = Author.create!(    name: " Alex",     has_won_awards: false,     books_written: 1,     created_at: Time.now)
    @author2 = Author.create!(    name: " Peyton",     has_won_awards: true,     books_written: 2,     created_at: Time.now - 2.hours)
    @author3 = Author.create!(    name: " Gabe",     has_won_awards: false,     books_written: 3,     created_at: Time.now - 1.hours)
  end

  it(" #1.name of each author record in system") do
    visit("/authors")
    expect(page).to(have_content("Authors name:#{@author1.name}"))
    expect(page).to(have_content("Authors name:#{@author2.name}"))
    expect(page).to(have_content("Authors name:#{@author3.name}"))
  end

  describe("I see that records are ordered by most recently created first") do
    it("#6.And next to each of the records I see when it was created") do
      visit("/authors")
      expect(@author1.name).to(appear_before(@author3.name))
      expect(@author2.name).to(appear_before(@author3.name))
    end
  end
end

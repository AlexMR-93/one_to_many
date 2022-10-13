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
      expect(@author3.name).to(appear_before(@author2.name))
    end
  end

  describe("When I visit any page on the site") do
    it("#9.Then I see a link at the top of the page that takes me to the Parent Index") do
      visit("/authors")
      expect(page).to(have_link("Authors"))
    end
  end

  describe("I see a link to create a new Parent record, 'New Parent'") do
    it("#11.click link ,Then I am taken to '/parents/new' where I  see a form for a new parent record") do
      visit("/authors")
      expect(page).to(have_link("New Parent"))
      click_link("New Parent")
      expect(current_path).to(eq("/authors/new"))
    end
  end
end

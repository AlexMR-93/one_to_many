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
    expect(page).to(have_content("Number of books associated with author:#{@author1.book_count}"))
  end

  describe("When I visit a parent show page ('/parents/:id')") do
    it("#10.Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')") do
      visit("/authors/#{@author1.id}")
      expect(page).to(have_link("Books pertaining to Author"))
      click_link("Books pertaining to Author")
      expect(current_path).to(eq("/authors/#{@author1.id}/books"))
    end
  end

  describe(" I see a link to update the parent Update Parent") do
    describe("I click the link Update Parent") do
      it("#12.I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:") do
        visit("/authors/#{@author1.id}")
        expect(page).to(have_link("Update Author"))
        click_link(("Update Author"))
        expect(current_path).to(eq("/authors/#{@author1.id}/edit"))
      end
    end
  end

  describe("I fill out the form with updated information") do
    describe("I click the button to submit the form") do
      describe("Then a `PATCH` request is sent to '/parents/:id',the parent's info is updated,") do
        it("I am redirected to the Parent's Show page where I see the parent's updated info") do
          visit("/authors/#{@author1.id}/edit")
          fill_in("name",           with: "TIMON")
          fill_in("books_written",           with: 7)

          #choose(("Has won awards(True)"))
          click_button("Submit")
          expect(current_path).to(eq("/authors/#{@author1.id}"))
        end
      end
    end
  end
end

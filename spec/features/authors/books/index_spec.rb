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
      expect(page).to(have_content("Book length is #{@book1.pages} page(s)"))
      expect(page).to(have_content("Book title:#{@book4.title}"))
      expect(page).to(have_content("Best seller?#{@book4.best_seller}"))
      expect(page).to(have_content("Book length is #{@book4.pages} page(s)"))
    end
  end

  describe(" I see a link to add a new adoptable child for that parent Create Child") do
    describe(" I click the link") do
      it("#13. I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child") do
        visit("/authors/#{@author1.id}/books")
        expect(page).to(have_link("Create Book"))
        click_link(("Create Book"))
        expect(current_path).to(eq("/authors/#{@author1.id}/books/new"))
      end
    end
  end

  describe("I see a link to sort children in alphabetical order") do
    describe(" I click on the link") do
      it("#16.I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order") do
        visit("/authors/#{@author1.id}/books")
        expect(page).to(have_link("Sort Alphabetically"))
        click_link("Sort Alphabetically")
        expect(current_path).to(eq("/authors/#{@author1.id}/books"))
      end
    end
  end

  describe("I visit the Parent's children Index Page") do
    describe("I see a form that allows me to input a number value") do
      describe("When I input a number value and click the submit button that reads") do
        describe(" Only return records with more than `number`of`column_name`") do
          it("#21.I am brought back to the current index page with only the records that meet that threshold shown.") do
            visit("/authors/#{@author1.id}/books")
            expect(page).to(have_button("Filter book by page QTY"))
            fill_in("Number of pages book contains:",             with: 120)
            click_button("Filter book by page QTY")
            expect(current_path).to(eq("/authors/#{@author1.id}/books"))
            expect(page).to(have_content(@book1.title))
          end
        end
      end
    end
  end
end

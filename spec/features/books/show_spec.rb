require "rails_helper"


RSpec.describe("Books show page") do
  before(:each) do
    @author1 = Author.create!(    name: " Alex",     has_won_awards: false,     books_written: 1)
    @book1 = @author1.books.create!(    title: "Spiderwick",     best_seller: true,     pages: 120)
    @author2 = Author.create!(    name: " Peyton",     has_won_awards: true,     books_written: 2)
    @book2 = @author2.books.create!(    title: "Harry Potter",     best_seller: true,     pages: 140)
    @author3 = Author.create!(    name: " Gabe",     has_won_awards: false,     books_written: 3)
    @book3 = @author3.books.create!(    title: "The Series of Unfortunate events",     best_seller: true,     pages: 100)
  end

  describe("I visit '/child_table_name/:id'") do
    it("#4. the child with that id including the child's attributes") do
      visit("/books/#{@book1.id}")
      expect(page).to(have_content("Title:#{@book1.title}"))
      expect(page).to(have_content("Best Seller:#{@book1.best_seller}"))
      expect(page).to(have_content("Length of book:#{@book1.pages} pages"))
    end
  end

  describe("I see a link to update that Child Update Child") do
    describe("taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:") do
      describe("I click the button to submit the form Update Child ") do
        describe("a `PATCH` request is sent to '/child_table_name/:id', ") do
          it("#14.the child's data is updated,redirected to the Child Show page where I see the Child's updated info") do
            visit("/books/#{@book1.id}")
            expect(page).to(have_link("Update Book"))
            click_link("Update Book")
            expect(current_path).to(eq("/books/#{@book1.id}/edit"))
            fill_in("title",             with: "NEW BOOK")

            #choose("true")
            fill_in("pages",             with: 674)
            click_button("Create Book")
          end
        end
      end
    end
  end

  describe("I see a link to delete the child") do
    describe("When I click the link Delete Child") do
      it("#20.Then a 'DELETE' request is sent to '/books/:id',") do
        visit("/books/#{@book1.id}")
        expect(page).to(have_link("Delete #{@book1.title}"))
        click_link(("Delete #{@book1.title}"))
        expect(current_path).to(eq("/books"))
      end
    end
  end
end

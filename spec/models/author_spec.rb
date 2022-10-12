require "rails_helper"


RSpec.describe(Author, type: :model) do
  describe("validations") do
    it { should(validate_presence_of(:name)) }
    it { should(validate_numericality_of(:books_written)) }
    it { should(allow_value(true).for(:has_won_awards)) }
    it { should(allow_value(false).for(:has_won_awards)) }
  end

  describe("models") do
    it { should(have_many(:books)) }
  end

  describe("model method") do
    before(:each) do
      @author1 = Author.create!(      name: " Alex",       has_won_awards: false,       books_written: 1,       created_at: Time.now)
      @book1 = @author1.books.create!(      title: "Spiderwick",       best_seller: true,       pages: 120)
      @book4 = @author1.books.create!(      title: "Wickspider",       best_seller: false,       pages: 300)
      @author2 = Author.create!(      name: " Peyton",       has_won_awards: true,       books_written: 2,       created_at: Time.now - 2.hours)
      @author3 = Author.create!(      name: " Gabe",       has_won_awards: false,       books_written: 3,       created_at: Time.now - 1.hours)
    end

    it("order by creation") do
      expect(Author.order_by_creation).to(eq([@author1, @author3, @author2]))
    end

    it("count_of_books") do
      expect(@author1.book_count).to(eq(2))
    end
  end
end

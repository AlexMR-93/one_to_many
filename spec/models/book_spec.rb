require "rails_helper"


RSpec.describe(Book, type: :model) do
  describe("validations") do
    it { should(validate_presence_of(:title)) }
    it { should(validate_numericality_of(:pages)) }
    it { should(allow_value(true).for(:best_seller)) }
    it { should(allow_value(false).for(:best_seller)) }
  end

  describe("models") do
    it { should(belong_to(:author)) }
  end

  describe("model method book") do
    before(:each) do
      @author1 = Author.create!(      name: " Alex",       has_won_awards: false,       books_written: 1,       created_at: Time.now)
      @book1 = @author1.books.create!(      title: "Spiderwick",       best_seller: true,       pages: 120)
      @book4 = @author1.books.create!(      title: "Wickspider",       best_seller: false,       pages: 300)
      @author2 = Author.create!(      name: " Peyton",       has_won_awards: true,       books_written: 2,       created_at: Time.now - 2.hours)
      @author3 = Author.create!(      name: " Gabe",       has_won_awards: false,       books_written: 3,       created_at: Time.now - 1.hours)
    end

    it("only see records where the boolean column is `true`") do
      expect(Book.sort_by_true).to(eq([@book1]))
    end
  end
end

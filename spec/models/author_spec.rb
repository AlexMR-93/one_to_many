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
end

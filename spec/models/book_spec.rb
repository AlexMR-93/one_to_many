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
end

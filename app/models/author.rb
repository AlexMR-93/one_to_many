class Author < ApplicationRecord
  validates_presence_of :name
  validates_numericality_of :books_written
  validates :has_won_awards,   inclusion: [true, false]
  has_many :books

  def self.order_by_creation
    self.order(    created_at: :desc)
  end
end

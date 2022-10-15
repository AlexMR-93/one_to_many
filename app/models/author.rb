class Author < ApplicationRecord
  validates_presence_of :name
  validates_numericality_of :books_written
  validates :has_won_awards,   inclusion: [true, false]
  has_many :books,   dependent: :delete_all

  def self.order_by_creation
    self.order(    created_at: :desc)
  end

  def book_count
    self.books.count
  end
end

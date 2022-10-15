class Book < ApplicationRecord
  validates_presence_of :title
  validates_numericality_of :pages
  validates :best_seller,   inclusion: [true, false]
  belongs_to :author

  def self.sort_by_true
    self.where(    best_seller: :true)
  end
end

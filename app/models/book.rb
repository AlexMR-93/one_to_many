class Book < ApplicationRecord
  validates_presence_of :title
  validates_numericality_of :pages
  validates :best_seller,   inclusion: [true, false]
  belongs_to :author
end

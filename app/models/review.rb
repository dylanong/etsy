class Review < ApplicationRecord
  belongs_to :order

  validates :review, presence: true, length: { minimum: 6 }
  validates :rating, presence: true, inclusion: { in: (1..5) }
end

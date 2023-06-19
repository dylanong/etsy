class Product < ApplicationRecord
QTYALLOWED = [1, 2, 3, 4, 5, 6, 7, 8]

  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true

  has_many :favourites
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :reviews
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_one_attached :photo

  def average_rating
    reviews.average(:rating)
  end
end

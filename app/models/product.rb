class Product < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true

  has_many :favourites
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :reviews, through: :orders, dependent: :destroy
  has_many :product_categories
  has_many :categories, through: :product_categories
end

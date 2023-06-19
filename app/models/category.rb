class Category < ApplicationRecord
  validates :name, presence: true

  has_many :product_categories
  has_many :products, through: :product_categories

  scope :main_category, -> {
    where(parent_id: nil)
  }

  def find_children
    Category.where(parent_id: self.id)
  end

  def find_parent
    Category.find(self.parent_id)
  end

  def self.all_root_categories
    categories = Category.main_category.map do |category|
      root_categories(category)
    end
    categories.flatten
  end

  def self.root_categories(category)
    return category if category.find_children.empty?

    categories = find_root(category.find_children)
    categories = find_root(categories.flatten)
    categories.flatten
  end

  def self.all_products(category)
    return category.products if category.find_children.empty?

    categories = root_categories(category)
    items = []
    categories.each do |category|
      items << category.products unless category.products.empty?
    end
    items.flatten
  end

  private

  def self.find_root(categories)
    categories.map do |elem|
      if elem.find_children.empty?
        elem
      else
        elem.find_children
      end
    end
  end
end

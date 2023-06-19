class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = Category.all_products(@category)
  end
end

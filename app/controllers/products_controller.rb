class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    @product.user = current_user
    productcategory = ProductCategory.new
    productcategory.product = @product
    category = Category.find(params[:product][:category_ids].last.to_i)
    productcategory.category = category

    if @product.save
      productcategory.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def listing
    @products = current_user.products
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description, :photo, categories: [])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

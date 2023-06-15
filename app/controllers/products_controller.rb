class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    @product.user = User.first

    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description, :photo)
  end
end

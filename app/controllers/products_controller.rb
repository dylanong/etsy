class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    @product.user = current_user

    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def show
  #   @product = Product.find(params[:id])
  # end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description, :photo)
  end
end

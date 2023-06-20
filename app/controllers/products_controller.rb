class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = current_user.products
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
    @circles = [
      { name: "Lego Pagani",
        img_url: "https://uncrate.com/p/2023/02/lego-pagani-utopia-76915-1.jpg" },
      { name: "Mini Yoda",
        img_url: "https://uncrate.com/p/2023/03/lego-grogu-keychain-5006860-2.jpg" },
      { name: "Maharishi Cave Tent",
        img_url: "https://uncrate.com/p/2023/06/heimplanet-maharishi-cave-tent-1.jpg" },
      { name: "Monopoly Heirloom",
        img_url: "https://uncrate.com/p/2021/01/monopoly-heirloom-edition-41.jpg" },
      { name: "Dryden Briefcase",
        img_url: "https://uncrate.com/p/2020/03/filson-dryden-briefcase-1.jpg" }
    ]
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description, :photo, categories: [])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

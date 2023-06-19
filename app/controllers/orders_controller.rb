class OrdersController < ApplicationController
  before_action :set_order

  def add
    product = Product.find(params[:product_id])

    if @order.products.include?(product)
      order.products.find(params[:product_id]).quantity += params[:quantity].to_i
    else
      @line_item = LineItem.new
      @line_item.order = @order
      @line_item.quantity = params[:quantity].to_i
      @line_item.save
    end

    redirect_to product_path(product)
  end

  def show

  end

  def deal
    @order.confirmed!
  end

  def set_order
    latest_order = current_user.orders.last

    if latest_order.confirmed?
      @order = Order.new
      @order.user = current_user
      @order.save
    else
      @order = latest_order
    end
  end
end

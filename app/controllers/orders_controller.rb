class OrdersController < ApplicationController
  before_action :set_order

  def add
    product = Product.find(params[:product_id])

    if @order.products.include?(product)
      order.products.find(params[:product_id]).quantity += params[:quantity]
    else
    end
  end



  def set_order
    latest_order = current_user.order.last

    if latest_order.confirmed?
      @order = Order.new
      @order.user = current_user
      @order.save
    else
      @order = latest_order
    end
  end
end

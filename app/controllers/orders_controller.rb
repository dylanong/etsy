class OrdersController < ApplicationController
  before_action :set_order, exclude: [:show]
  after_action :cal_price

  def index
    @seller_orders = []
    current_user.products.each do |product|
      product.line_items.each do |item|
       @seller_orders << item if item.order.confirmed?
      end
    end
    @seller_orders = @seller_orders.order("order_id DESC") unless @seller_orders.empty?
  end

  def add
    product = Product.find(params[:product_id])

    if @order.products.include?(product)
      order.line_items.find(product_id: params[:product_id]).quantity += params[:quantity].to_i
    else
      @line_item = LineItem.new
      @line_item.order = @order
      @line_item.product = product
      @line_item.quantity = params[:quantity].to_i
      @line_item.save
    end

    redirect_to order_path(current_user)
  end

  def destroy
  end

  def show

  end

  def deal
    @order.update(confirmed?: true)
    @order.line_items.each do |item|
      item.product.quantity -= item.quantity
    end
    redirect_to orders_confirmation_path
  end

  def confirmation

  end

  private

  def set_order
    latest_order = current_user.orders.last

    if latest_order.confirmed?
      @order = Order.new
      @order.user = current_user
      @order.total_price = 0
      @order.save
    else
      @order = latest_order
    end
  end

  def cal_price
    @order.total_price = 0

    @order.line_items.each do |item|
      @order.total_price += item.quantity * item.product.price
    end
  end
end

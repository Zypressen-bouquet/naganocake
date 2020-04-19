class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
      @orders = current_user.orders.page(params[:page]).per(10)
  end

  def input
    @user = current_user
    @order = Order.new
  end

  def new
    # binding.pry
    @carts = current_user.carts
    @order = Order.new(orders_params)
    @payment_method = params[:order][:payment_method]
    @delivery_addr = params[:order][:delivery_addr]
    case @delivery_addr
    when "my_addr" then
      @post_code = current_user.post_code
      @address = current_user.address
      @name = current_user.last_name + " " + current_user.first_name
    when "registered_addr" then
      delivery = Delivery.find(params[:order][:registered_address])
      @post_code = delivery.post_code
      @address = delivery.address
      @name = delivery.name
    when "new_addr" then
      @post_code = params[:order][:new_post_cd]
      @address = params[:order][:new_address]
      @name = params[:order][:new_name]
    end
  end

  def create
    @order = current_user.orders.new(orders_params)
    # binding.pry
    # 保存できるか確認
    if @order.save
      current_user.carts.each do |cart|
        ordered_product = @order.ordered_products.create(
          order_id: @order.id,
          product_id: cart.product_id,
          units: cart.units,
          price: cart.product.tax_price,
          working_status: 1
        )
      end
      if params[:delivery_addr] == "new_addr" then
        current_user.deliveries.create(post_code: @order.post_code,address: @order.address,name: @order.name)
        binding.pry
      end
      current_user.carts.destroy_all
      redirect_to complete_orders_path
    else
      redirect_to input_orders_path
      flash[:notice] = "登録に失敗しました。"
    end
  end

  def complete
  end

  def show
    @order = Order.find(params[:id])
  end


private
  def orders_params
    params.require(:order).permit(:user_id,:payment_method,:shipping_fee,:total_payment,:status,:name,:address,:post_code)
  end
end

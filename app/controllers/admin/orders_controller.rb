class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!
    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
        @order_item = @order.ordered_products
    end

    def update
        @order = Order.find(params[:id])
        @order_status = params[:order][:status]
        @order.update(status: @order_status)
        #明日ここからenumが数字でしか受け取ってくれない

        if @order_status == "making"
            @order.ordered_products.update(working_status: "making")
        elsif @order_status == "waiting_payment"
            @order.ordered_products.update(working_status: "cannot")
        elsif @order_status == "confirm"
            @order.ordered_products.update(working_status: "waiting")
        elsif @order_status == "waiting_shipping"
            @order.ordered_products.update(working_status: "done")
        elsif @order_status == "waiting_shipping"
            @order.ordered_products.update(working_status: "done")
        end
        redirect_to admin_orders_path
    end

end

class Admin::OrderedProductsController < ApplicationController
    before_action :authenticate_admin!
    def update
        @ordered_product = OrderedProduct.find(params[:id])
        @order = Order.find(params[:order_id])
        @ordered_product.update(ordered_params)

        wstatus = @order.ordered_products.map do |order|
            order.working_status
        end.uniq
        
        if wstatus.length == 1 && wstatus[0] == "done"            
            @order.update(status: "waiting_shipping")
        end
        redirect_to admin_order_path(@order)
    end

private
    def ordered_params
        params.require(:ordered_product).permit(:working_status)
    end


end
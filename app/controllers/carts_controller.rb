class CartsController < ApplicationController
      before_action :authenticate_user!

    def index
        @carts = current_user.carts
    end

    def create
        @cart = Cart.new(cart_params)
        @cart.user_id = current_user.id
        @current_cart = Cart.find_by(product_id: @cart.product_id,user_id: @cart.user_id)
        if @current_cart.nil?
            if @cart.save
                redirect_to carts_path, notice: "カートに商品が追加されました。"
            else
                @carts = current_user.carts
                render 'index'
            end
        else
            added_carts = @current_cart.units + params[:cart][:units].to_i
            @current_cart.update(units: added_carts)
            redirect_to carts_path
        end
    end

    def update
        @cart = Cart.find(params[:id])
        #@cart.units += cart_params[:units].to_i
        @cart.update(cart_params)
        redirect_to carts_path
    end

    def destroy
        cart = Cart.find(params[:id])
        cart.destroy
        redirect_to carts_path
    end

    def destroy_all
        @cart = current_user.carts
        @cart.destroy_all
        redirect_to carts_path, notice: "カートが空になりました。"
    end

    private

    def cart_params
        params.require(:cart).permit(:units,:product_id)
    end
    
end

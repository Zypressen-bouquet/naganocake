class DeliveriesController < ApplicationController
    before_action :authenticate_user!

	def index
		@delivery_new = Delivery.new
	    @deliveries = current_user.deliveries
	end

	def create
		@delivery = Delivery.new(delivery_params)
		@delivery.user_id = current_user.id
		if @delivery.save
		   redirect_to deliveries_path
		else
		   @delivery_new = Delivery.new
		   @deliveries = current_user.deliveries
		   render :index
		end
	end

	def edit
		@delivery = Delivery.find(params[:id])
	end

	def update
		delivery = Delivery.find(params[:id])
		delivery.update(delivery_params)
		redirect_to deliveries_path
	end

	def destroy
		delivery = Delivery.find(params[:id])
		delivery.destroy
		redirect_to deliveries_path
	end

	private
	def delivery_params
		params.require(:delivery).permit(:name, :post_code, :address)

    end
end

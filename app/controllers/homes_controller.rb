class HomesController < ApplicationController
  def top
  	@products = Product.where(status: true)
  	@genres = Genre.where(display_status: true)
    @images = Product.where(status: true).where.not(image_id: nil)
  end
end

module Api::V1
  class InventoryController < ApplicationController
    def index
      render json: Product.includes(:images, :variants).all
    end
  end
end

module Api::V1
  class InventoryController < ApplicationController
    def index
      render json: Product.all
    end
  end
end

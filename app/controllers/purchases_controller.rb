class PurchasesController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @purchase = Purchase.new
  end

  def create
  end

end

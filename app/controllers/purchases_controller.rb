class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @product = Product.find(params[:product_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PuchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

   private

  def purchase_params
    params.require(:purchase_address).permit(:token, :postal_code, :prefecture, :city, :address, :building, :phone_number, :purchase_id).merge(user_id: current_user.id, product_id: @product.id)
  end

end

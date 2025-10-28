class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product)
          .permit(:product_name, :description, :product_status_id, :category_id, :prefecture_id,
                  :delivery_time_id, :delivery_cost_id, :product_price, :product_image)
          .merge(user_id: current_user.id)
  end
end

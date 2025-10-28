class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_product, only: [:show, :edit, :update]

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

  def show
  end

  def edit
    return if user_signed_in? && @product.user_id == current_user.id
    redirect_to action: :index
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product)
          .permit(:product_name, :description, :product_status_id, :category_id, :prefecture_id,
                  :delivery_time_id, :delivery_cost_id, :product_price, :product_image)
          .merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

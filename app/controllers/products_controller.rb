class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:edit, :show, :update, :destroy, :move_to_index]
  before_action :path_limit, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :state_id, :shipping_charge_id, :prefecture_id,
                                    :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def path_limit
    redirect_to root_path unless current_user.id == @product.user_id
  end

  def move_to_index
    @product = Product.find(params[:id])
    redirect_to root_path if current_user.id! == @product.user_id || @product.order.present?
  end
end

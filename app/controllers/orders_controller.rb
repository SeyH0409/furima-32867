class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_redirect, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_system
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postcode, :city, :block, :phone_number, :building,
                   :prefecture_id).merge(token: params[:token], user_id: current_user.id, product_id: params[:product_id])
  end

  def pay_system
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_redirect
    if current_user.id == @product.user_id || @product.order.present?
      redirect_to root_path
    end 
  end
end

class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :move_to_index


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @orders_addresses = OrdersAddresses.new
  end

  def create
    @orders_addresses = OrdersAddresses.new(orders_addresses_params)
    if @orders_addresses.valid?
      pay_item
      @orders_addresses.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end






  private

  def orders_addresses_params
    params.require(:orders_addresses).permit(:post_code, :pref_id, :munic, :address, :building, :tel).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: orders_addresses_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @item.order.present? || current_user.id == @item.user.id
      redirect_to root_path
    end
  end

end
class OrdersController < ApplicationController


  def index
    @item = Item.find(params[:item_id])
    @orders_addresses = OrdersAddresses.new
  end

  def create
    @item = Item.find(params[:item_id])
    @orders_addresses = OrdersAddresses.new(orders_addresses_params)
    if @orders_addresses.valid?
      pay_item
      @orders_addresses.save
      return redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end






  private

  def orders_addresses_params
    params.require(:orders_addresses).permit(:post_code, :pref_id, :munic, :address, :building, :tel).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end


  def pay_item
    Payjp.api_key = "sk_test_fd36edd93e76d4e1ef274eff"
    Payjp::Charge.create(
      amount: @item.price,
      card: orders_addresses_params[:token],
      currency: 'jpy'
    )
  end

end
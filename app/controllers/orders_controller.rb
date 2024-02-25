class OrdersController < ApplicationController

  def new
    @orders_addresses = OrdersAddresses.new
  end

  def create
    @orders_addresses = OrdersAddresses.new(orders_addresses_params)
    if @orders_addresses.valid?
      @orders_addresses.save
      redirect_to root_path
    else
      render :new
    end
  end




  private

  def orders_addresses_params
    params.require(:orders_addresses).permit(:item_id, :user_id, :post_code, :pref_id, :munic, :address, :building, :tel, :token)
  end
end

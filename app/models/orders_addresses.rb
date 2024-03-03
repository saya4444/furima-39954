class OrdersAddresses
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :post_code, :pref_id, :munic, :address, :building, :tel, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :pref_id  , numericality: { other_than: 1 }
    validates :munic
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :item_id, :user_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create!(post_code: post_code, pref_id: pref_id, munic: munic, address: address, building: building, tel: tel, order_id: order.id)
  end
end
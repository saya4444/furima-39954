class OrdersAddresses
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :post_code, :pref_id, :munic, :address, :building, :tel, :order_id

  validates :post_code , format: { with: /\A\d{3}-\d{4}\z/ }
  validates :pref_id   , presence: true, numericality: { other_than: 1 }
  validates :munic     , presence: true
  validates :address   , presence: true
  validates :building
  validates :tel       , presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :order     , presence: true

  def save
    order = Order.create!(item_id: item_id, user_id: user_id)
    Address.create_address!(post_code: post_code, pref_id: pref_id, munic: munic, address: address, building: building, tel: tel, order_id: order_id)
  end
end
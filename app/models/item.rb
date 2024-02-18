class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :burden
    belongs_to_active_hash :pref
    belongs_to_active_hash :period


validates :image        , presence: true
validates :item         , presence: true
validates :explanation  , presence: true
validates :category_id  , presence: true, numericality: { other_than: 1 }
validates :condition_id , presence: true, numericality: { other_than: 1 }
validates :burden_id    , presence: true, numericality: { other_than: 1 }
validates :pref_id      , presence: true, numericality: { other_than: 1 }
validates :period_id    , presence: true, numericality: { other_than: 1 }
validates :price        , presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


  belongs_to       :user
  has_one_attached :image


end

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
  validates :category_id  , presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id , presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :burden_id    , presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :pref_id      , presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :period_id    , presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price        , presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :user         , presence: true


  belongs_to :user


end

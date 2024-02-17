class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, class_name: 'ActiveHash::Category'
  belongs_to_active_hash :condition, class_name: 'ActiveHash::Condition'
  belongs_to_active_hash :burden, class_name: 'ActiveHash::Burden'
  belongs_to_active_hash :pref, class_name: 'ActiveHash::Pref'
  belongs_to_active_hash :period, class_name: 'ActiveHash::Period'


  validates :image        , presence: true
  validates :item         , presence: true
  validates :explanation  , presence: true
  validates :category_id  , presence: true
  validates :condition_id , presence: true
  validates :burden_id    , presence: true
  validates :pref_id      , presence: true
  validates :period_id    , presence: true
  validates :price        , presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :user         , presence: true


  belongs_to :user


end

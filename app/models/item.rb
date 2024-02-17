class Item < ApplicationRecord

  validates :image        , presence: true
  validates :item         , presence: true
  validates :explanation  , presence: true
  validates :category_id  , presence: true
  validates :condition_id , presence: true
  validates :burden_id    , presence: true
  validates :pref_id      , presence: true
  validates :period_id    , presence: true
  validates :price        , presence: true
  validates :user         , presence: true




  belongs_to :user

end

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.string     :item         , null: false
      t.text       :explanation  , null: false
      t.integer    :category_id  , null: false
      t.integer    :condition_id , null: false
      t.integer    :burden_id    , null: false
      t.integer    :pref_id      , null: false
      t.integer    :period_id    , null: false
      t.integer    :price        , null: false
      t.references :user         , null: false, foreign_key: true

      t.timestamps
    end
  end
end

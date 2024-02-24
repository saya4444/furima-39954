class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|

      t.string     :post_code , null: false
      t.integer    :pref_id   , null: false
      t.string     :munic     , null: false
      t.string     :address   , null: false
      t.string     :building
      t.string     :tel       , null: false
      t.references :order     , null: false, foreign_key: true

      t.timestamps
    end
  end
end

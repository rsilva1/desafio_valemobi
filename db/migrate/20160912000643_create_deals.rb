class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :deal_type
      t.references :buyer, index: true
      t.references :seller, index: true
      t.references :item, index: true, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end

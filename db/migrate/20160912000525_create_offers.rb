class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :user, index: true, foreign_key: true
      t.text :commentary
    end
  end
end

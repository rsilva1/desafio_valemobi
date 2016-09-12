class CreateJoinTableDepotItem < ActiveRecord::Migration
  def change
    create_join_table :depots, :items do |t|
      # t.index [:depot_id, :item_id]
      # t.index [:item_id, :depot_id]
    end
  end
end

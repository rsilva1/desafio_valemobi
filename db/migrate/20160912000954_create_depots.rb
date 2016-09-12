class CreateDepots < ActiveRecord::Migration
  def change
    create_table :depots do |t|
      t.references :user, index: true, foreign_key: true
    end
  end
end

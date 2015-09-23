class AddPinsTable < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :sim_number, null: false

      t.timestamps null: false
    end
  end
end

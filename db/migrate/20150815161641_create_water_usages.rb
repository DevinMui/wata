class CreateWaterUsages < ActiveRecord::Migration
  def change
    create_table :water_usages do |t|
      t.integer :moisture
      t.float :moisture_float

      t.timestamps null: false
    end
  end
end

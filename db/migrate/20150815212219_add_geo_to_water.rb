class AddGeoToWater < ActiveRecord::Migration
  def change
  	add_column :water_usages, :latitude, :float
  	add_column :water_usages, :longitude, :float
  end
end

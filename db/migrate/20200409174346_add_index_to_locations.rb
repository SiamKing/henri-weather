class AddIndexToLocations < ActiveRecord::Migration[6.0]
  def change
    add_index :locations, :zipcode, unique: true
  end
end

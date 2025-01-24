class AddCoordinatesToVillas < ActiveRecord::Migration[7.1]
  def change
    add_column :villas, :latitude, :float
    add_column :villas, :longitude, :float
  end
end

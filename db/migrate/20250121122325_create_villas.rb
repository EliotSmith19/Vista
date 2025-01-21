class CreateVillas < ActiveRecord::Migration[7.1]
  def change
    create_table :villas do |t|
      t.string :villa_name
      t.string :villa_location
      t.string :img_url
      t.text :description
      t.float :price
      t.float :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

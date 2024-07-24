class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :genre
      t.string :address
      t.text :about
      t.string :image
      t.time :opentime
      t.string :phone
      t.string :sns
      t.text :whatsnew

      t.timestamps
    end
  end
end

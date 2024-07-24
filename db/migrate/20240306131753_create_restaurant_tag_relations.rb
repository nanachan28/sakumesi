class CreateRestaurantTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_tag_relations do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end

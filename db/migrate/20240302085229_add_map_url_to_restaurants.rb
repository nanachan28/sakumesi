class AddMapUrlToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :mapurl, :string
  end
end

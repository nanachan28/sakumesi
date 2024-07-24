class AddDayoffToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :dayofftue, :boolean
    add_column :restaurants, :dayoffwed, :boolean
    add_column :restaurants, :dayoffthu, :boolean
    add_column :restaurants, :dayofffri, :boolean
    add_column :restaurants, :dayoffsat, :boolean
    add_column :restaurants, :dayoffsun, :boolean
  end
end

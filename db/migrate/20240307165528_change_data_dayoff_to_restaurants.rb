class ChangeDataDayoffToRestaurants < ActiveRecord::Migration[6.1]
  def change
    change_column :restaurants, :dayoff, :boolean
  end
end

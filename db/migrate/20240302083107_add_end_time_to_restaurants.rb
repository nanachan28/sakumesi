class AddEndTimeToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :endtime, :time
  end
end

class RenameDayoffColumnToRestaurants < ActiveRecord::Migration[6.1]
  def change
    rename_column :restaurants, :dayoff, :dayoffmon
  end
end

class RenameSnsColumnToRestaurants < ActiveRecord::Migration[6.1]
  def change
    rename_column :restaurants, :sns, :website
  end
end

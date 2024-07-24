class AddPayToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :pay, :string
  end
end

class AddDetailsToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :seattype, :string
    add_column :restaurants, :dayoff, :string
  end
end

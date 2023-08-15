class AddCabletokenToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cabletoken, :string
  end
end

class AddAddressToStudios < ActiveRecord::Migration[7.0]
  def change
    add_column :studios, :address, :string
  end
end

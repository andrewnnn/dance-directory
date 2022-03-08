class AddCityToStudios < ActiveRecord::Migration[7.0]
  def change
    add_column :studios, :city, :string
  end
end

class RemoveStyleFromStudios < ActiveRecord::Migration[7.0]
  def change
    remove_column :studios, :style, :text
  end
end

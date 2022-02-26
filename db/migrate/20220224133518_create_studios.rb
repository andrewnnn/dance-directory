class CreateStudios < ActiveRecord::Migration[7.0]
  def change
    create_table :studios do |t|
      t.string :name
      t.text :description
      t.text :style

      t.timestamps
    end
  end
end

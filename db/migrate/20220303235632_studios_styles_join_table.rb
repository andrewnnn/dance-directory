class StudiosStylesJoinTable < ActiveRecord::Migration[7.0]
  def change
    # This is enough; you don't need to worry about order
    create_join_table :studios, :styles
  end
end

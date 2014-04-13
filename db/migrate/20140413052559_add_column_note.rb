class AddColumnNote < ActiveRecord::Migration
  def up
    add_column :notes , :user_id , :integer
    add_index :notes , :id
    add_index :notes , :user_id
  end

  def down
  end
end

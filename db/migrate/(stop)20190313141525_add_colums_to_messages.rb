class AddColumsToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :user_id, :integer
    add_index :messages, :user_id
    add_index :messages, [:id, :user_id], unique: true
  end
end

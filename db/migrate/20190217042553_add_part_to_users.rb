class AddPartToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :part, :text
    add_column :users, :artist, :text
  end
end

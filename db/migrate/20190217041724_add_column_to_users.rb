class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :genre, :text
    add_column :users, :age, :integer
    add_column :users, :gender, :text
    add_column :users, :content, :text
  end
end

class AddGenreToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :genre, :text
    add_column :posts, :age, :integer
    add_column :posts, :gender, :text
  end
end

class AddColumToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :height, :float
    add_column :users, :weight, :float
  end
end

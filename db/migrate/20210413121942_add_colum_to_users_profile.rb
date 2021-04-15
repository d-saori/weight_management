class AddColumToUsersProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :text
    add_column :users, :target_weight, :float
    add_column :users, :target_body, :float
  end
end

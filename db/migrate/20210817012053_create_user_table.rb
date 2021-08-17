class CreateUserTable < ActiveRecord::Migration[6.1]
  def change
    drop_column :users, :userID
    rename_column :users, :id, :userID
  end
end

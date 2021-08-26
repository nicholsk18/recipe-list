class AddRecipeRefToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :users, null: false, foreign_key: true
  end
end

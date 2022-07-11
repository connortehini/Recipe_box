class RemoveIngredientIdFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_index :recipes, :ingredient_id
    remove_column :recipes, :ingredient_id
  end
end

class RemoveCuisineFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :cuisine_id, :integer
  end
end

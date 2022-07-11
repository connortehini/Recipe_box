class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :instructions
      t.references :ingredient, null: false, foregin_key: true  

      t.timestamps
    end
  end
end

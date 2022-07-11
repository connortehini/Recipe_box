class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.integer :rating
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end

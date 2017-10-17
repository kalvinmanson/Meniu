class CreateQuests < ActiveRecord::Migration[5.1]
  def change
    create_table :quests do |t|
      t.references :user, foreign_key: true
      t.string :quest
      t.integer :min_price
      t.integer :max_price
      t.string :category
      t.string :options
      t.text :result
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end

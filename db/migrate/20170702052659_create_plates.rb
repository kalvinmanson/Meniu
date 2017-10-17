class CreatePlates < ActiveRecord::Migration[5.1]
  def change
    create_table :plates do |t|
      t.references :place, foreign_key: true
      t.string :name
      t.text :content
      t.string :category
      t.boolean :favored
      t.string :tags
      t.string :options
      t.integer :price
      t.boolean :active
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :plates, :deleted_at
  end
end

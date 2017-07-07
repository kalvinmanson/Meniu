class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.references :user, foreign_key: true
      t.references :city, foreign_key: true
      t.string :name
      t.date :expires_at
      t.string :address
      t.text :description
      t.string :phone
      t.string :email
      t.float :rank
      t.float :latitude
      t.float :longitude
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :places, :deleted_at
  end
end

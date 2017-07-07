class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :city, foreign_key: true
      t.string :uid
      t.string :provider
      t.string :role
      t.string :name
      t.boolean :active
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end

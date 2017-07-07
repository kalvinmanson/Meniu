class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.references :plate, foreign_key: true
      t.boolean :confirmed
      t.integer :rank
      t.text :comments

      t.timestamps
    end
  end
end

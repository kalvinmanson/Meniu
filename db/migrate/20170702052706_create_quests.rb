class CreateQuests < ActiveRecord::Migration[5.1]
  def change
    create_table :quests do |t|
      t.references :user, foreign_key: true
      t.string :quest
      t.text :result

      t.timestamps
    end
  end
end

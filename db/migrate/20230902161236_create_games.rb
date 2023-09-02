class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.boolean :is_public, default: true

      t.timestamps
    end
  end
end

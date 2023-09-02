class CreateRankings < ActiveRecord::Migration[7.0]
  def change
    create_table :rankings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :level, default: 0
      t.integer :score, default: 0
      t.string :timing

      t.timestamps
    end
  end
end

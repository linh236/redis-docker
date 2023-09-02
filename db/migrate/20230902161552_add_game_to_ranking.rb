class AddGameToRanking < ActiveRecord::Migration[7.0]
  def change
    add_reference :rankings, :game, null: false, foreign_key: true
  end
end

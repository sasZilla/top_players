class CreateTopPlayers < ActiveRecord::Migration
  def change
    create_table :top_players do |t|
      t.string :name
      t.text :img
      t.integer :played
      t.decimal :total_win

      t.timestamps null: false
    end
  end
end

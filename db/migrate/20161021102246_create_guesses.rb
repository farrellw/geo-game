class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :lat_guess
      t.integer :long_guess
      t.boolean :correct_or_false

      t.timestamps(null: false)
    end
  end
end

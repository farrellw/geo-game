class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    t.integer :country_id
    t.integer :difficulty
    t.integer :user_id

    t.timestamps(null: false)
    end
  end
end

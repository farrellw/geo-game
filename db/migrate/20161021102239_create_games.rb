class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    t.integer :locatable_id
    t.string :locatable_type
    t.integer :difficulty
    t.integer :user_id

    t.timestamps(null: false)
    end
  end
end

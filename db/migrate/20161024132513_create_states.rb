class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbreviation
      t.integer :latitude
      t.integer :longitude

      t.timestamps(null: false)
    end
  end
end
